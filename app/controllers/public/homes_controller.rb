class Public::HomesController < ApplicationController
  before_action :set_item, only: [:top]
  
  def top
    # @items = Item.order('id DESC').limit(4)
    @items = Item.all
    @items_latest4 = @items.first(4)
  end
  
  def about
    
  end
  
  private
  
  def set_item
    # PATHパラメータでitemを取得
    @item = Item.find_by(params[:item_id])
  end

  
end