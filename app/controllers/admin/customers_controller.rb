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
   @customers = Customer.find(params[:id])
   if @customers.update(customer_params)
     flash[:notice] = "更新情報を更新しました"
     redirect_to admin_customers_path
   else
     render :edit
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_deleted)
    end

end
