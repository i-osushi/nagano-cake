class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @genres = Genre.all
  end  
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end  
  
  # def get_item(params)
    # 最新商品じゃなかったら
    # return Item.all, 'default' unless params[:latest] 
    # 最新だったら
    # return Item.latest, 'latest' if params[:latest]
  # end

  
end
