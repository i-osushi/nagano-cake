class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index

    @cart_items = current_customer.cart_items
  end

  def create
    # @cart_item = current_customer.cart_items.build(cart_item_params)
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     @cart_item.item_id = params[:item_id]
    @cart_item.save
    redirect_to cart_items_path

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customers_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
    redirect_to customers_cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to customers_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
