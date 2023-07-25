class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

def index
  @customer = Customer.find(params[:customer_id])
  @orders = @customer.orders
  @order = Order.all.page(params[:page]).per(10)
end

def show
  @order = Order.find(params[:id])
end

def update
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: params[:id])
  if @order.update(order_params)
    @order_details.update_all(making_status: 1) if @order.status == "confirm_payment"
  end
  redirect_to admin_order_path(@order)
end

private

def order_params
  params.require(:order).permit(:status)
end
end