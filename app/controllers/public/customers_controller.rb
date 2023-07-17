class Public::CustomersController < ApplicationController
  
  def show
    
  end 
  
  def edit
  end
  
  def update
  end 
  
  # 顧客の退会確認画面
  def confirm_withdraw
  end 
  
  # 顧客の退会処理(ステータスの更新)
  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end  
end
