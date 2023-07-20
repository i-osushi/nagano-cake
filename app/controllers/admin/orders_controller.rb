class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

def show
  @orders = Oder.find(params[:id])
  @customer = @oder.customer_id
  @itme = @oder.item
end

def update
  @order = Oder.find(params[:id])

end

end
