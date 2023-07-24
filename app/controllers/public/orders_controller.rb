class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @customer = Customer.pluck(:name, :id)

  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    # 自分の住所を選んだ場合
    if params[:order][:select_address] == "own_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    # 登録済み住所を選んだ場合
    elsif params[:order][:select_address] == "registered_address"
      # addresに保存されているデータをfindを利用してcodeに保存する
      code = Address.find(params[:order][:address_id].to_i)
      @order.postal_code = code.postal_code
      @order.address = code.address
      @order.name = code.name

    # 新規住所を入力した場合
    elsif params[:order][:select_address] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render "index"
    end

  # カートに入っているすべての情報を取得する
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def create
    @order = Order.new(order_params)
    @order.save
    # 新規住所の保存
    if params[:order][:select_address] == "new_address"
      current_customer.address.create(address_params)
    end
    # カートアイテム商品詳細の保存
    current_customer.cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item_id
      @order_details.amount = cart_item.amount
      @order_details.price = (cart_item.item.price*1.08).floor
      @order_details.save
    end
    
    # カートアイテム内の商品削除
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


private
  def order_params
     params.require(:order).permit(:shipping_cost, :registered_address, :own_address, :select_address, :new_address, :customer_id, :total_payment, :payment_method, :name, :address, :postal_code, :status)
  end

end
