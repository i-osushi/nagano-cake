class Public::CustomersController < ApplicationController
  # before_action :is_matching_login_customer, only: [:edit, :update]
  
  def show
    @customer = current_customer
    
  end 
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    # @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    render "show"
  end 
  
  # 顧客の退会確認画面
  def confirm_withdraw
  end 
  
  # 顧客の退会処理(ステータスの更新)
  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
