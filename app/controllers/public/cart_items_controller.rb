class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: %i[increase decrease destroy]
  
  def index
    @cart_items = current_customer.cart_items
  end  
  
  def create
    update_or_create(params[:cart_item][:item_id])
    redirect_to cart_items_path
  end
  
  def update
    # 個数を１個増やす
    @cart_item.increment!(:amount, 1)
    # 元いた画面へ
    redirect_to request.referer
  end
  
  def destroy
    destroy_or_destroy_all(@cart_item)
    redirect_to request.referer
  end
  
  def destroy_all
    @cart_item.destroy
    redirect_to request.referer
  end
  
  private

  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

  def update_or_create(item_id)
    cart_item = current_customer.cart_items.find_by(item_id:)
    if cart_item
      cart_item.update!(:amount, 1)
    else
      # カート内商品を新たに作成
      current_customer.cart_items.build(item_id:).save
    end
  end

  def destroy_or_destroy_all(cart_item)
    # 
    if cart_item.amount > 1
      cart_item.destroy!(:amount, 1)
    else
      cart_item.destroy_all
    end
  end
end
