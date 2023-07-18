class Public::ItemsController < ApplicationController
  
  def index
    @item, @sort = get_item(params)
  end  
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end  
  
  def get_item(params)
    # 最新商品じゃなかったら
    return Item.all, 'default' unless params[:latest] 
    # 最新だったら
    return Item.latest, 'latest' if params[:latest]
  end

  
end
