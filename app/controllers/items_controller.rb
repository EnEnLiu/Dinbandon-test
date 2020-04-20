class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.where(deleted_at: nil)
    #@items = Item.available
  end

  def show
    #@item = Item.find(params[:id]) 
    #find_item

    #begin
    #  @item = Item.find(params[:id])      
    #rescue
    #  redirect_to items_path, notice: "沒有這個餐點"
    #end
    @comment = Comment.new
    @comments = @item.comment.order(id: :desc)
  end

  def edit
    #@item = Item.find(params[:id]) 
    #find_item
  end

  def update
    #@item = Item.find(params[:id]) 
    #find_item:
    if @item.update(item_params)
      redirect_to items_path, notice: '成功更新餐點'
    else
      render :edit
    end
  end

  def new
    @item = Item.new
  end

  def create
    #render html: params
    @item = Item.new(item_params)

    if @item.save
      #flash[:notice] = '成功新增餐點'
      redirect_to items_path, notice: '成功新增餐點'
    else
      render :new
    end
  end

  def destroy
    #find_item
    #item = Item.find(params[:id])
    @item.destroy
    #@item.update(deleted_at: Time.now)
    redirect_to items_path, alert: '成功刪除餐點'
  end

  private
  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :price,
                                 :spec,
                                 :category_id,
                                 :cover)
  end
  def find_item
    @item = Item.find(params[:id])
    #@item = Item.find_by!(id: params[:id], deleted_at: nil)
  end
end

