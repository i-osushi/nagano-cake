# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   # before_action :configure_sign_in_params, only: [:create]
   before_action :configure_permitted_parameters, if: :devise_controller?

  # ログインしてない場合はログイン画面に遷移
   before_action :authenticate_customer!, except: [:top, :about]

  # サインイン後の遷移
  # def after_sign_in_path_for(resource)
    # public_homes_path  #(current_user)
  # end

 # def after_sign_out_path_for(resource)
    # public_homes_path
 # end
   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end
   
     # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_customer
    @ucustomer = Customer.find_by(email: params[:customer][:email])
    if @customer 
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  
end
 

  # GET /resource/sign_in
  # def new
    # super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

