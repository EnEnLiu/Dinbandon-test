class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id]) 
    #begin
    #  @item = Item.find(params[:id])      
    #rescue
    #  redirect_to items_path, notice: "沒有這個餐點"
    #end
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
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: '成功刪除餐點'
  end


  private
  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :price,
                                 :spec)
  end

  def record_not_found
    render file: 'public/404.html',
           status: 404,
           layout: false
    #redirect_to items_path, notice: '找嘸!'
  end
end
