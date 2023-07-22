class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end
  
  def show
   @customers = Customer.find(params[:id])
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end
  
  def update
  end
  
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_active)
    end
    
end
