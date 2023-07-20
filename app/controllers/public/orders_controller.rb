class Public::OrdersController < ApplicationController
  # before_action :authenticate_customers!
  def new
    @order = Order.new
    @customer = Customer.pluck(:name, :id)

  end

  def confirm
    @order = Order.new(order_params)
    
    # 自分の住所を選んだ場合
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    # 登録済み住所を選んだ場合
    elsif params[:order][:select_address] == "1"
      # addresに保存されているデータをfindを利用してcodeに保存する
      code = Address.find(params[:order][:customer_id])
      @order.postal_code = code.postal_code
      @order.address = code.address
      @order.name = code.name

    # 新規住所を入力した場合
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render "index"
    end
  
  # カートに入っているすべての情報を取得する
    @cart_items = current_customer.cart_items.all
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
  end

  def complete
  end

  def index
  end

  def show
  end


private
  def order_params
     params.require(:order).permit(:registered_address, :own_address, :address_id, :select_address, :new_address, :customer_id, :shipping_cost, :total_payment, :payment_method, :name, :address, :postal_code, :status)
  end

end
