class Public::OrdersController < ApplicationController
  # before_action :authenticate_customers!
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    
    if params[:order][:select_address] == "0"
      
    end

  end

  def complete
  end

  def index
  end

  def show
  end
  
  def order_params
     params.require(:order).permit(:postal_code, :address, :last_name, :first_name, :payment_method)
  end
  
end
