class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items_page = Item.all.page(params[:page]).per(8)
    
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
