class ItemsController < ApplicationController
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

  def edit
    @item = Item.find(params[:id]) 
   
  end

  def update
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
end