class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
def show
  @oders = Oder.find(params[:id])
  @customer = @oder.customer_id
  @itme = @oder.item
end

def update
  @oder = Oder.find(params[:id])
  
end

end
