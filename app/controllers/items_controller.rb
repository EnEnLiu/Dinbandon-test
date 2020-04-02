class ItemsController < ApplicationController
  def index
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


  private
  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :price,
                                 :spec)
  end


end
