class Public::HomesController < ApplicationController
  before_action :set_item, only: [:top]

  def top
    @items = Item.all
    # 新着商品（４つ）
    @items_latest4 = @items.first(4)
    @genres = Genre.all
  end

  def about
  end


  private

  def set_item
    # PATHパラメータでitemを取得
    @item = Item.find_by(params[:item_id])
  end

end