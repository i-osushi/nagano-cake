# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   # before_action :configure_sign_in_params, only: [:create]
   before_action :configure_permitted_parameters, if: :devise_controller?

  # ログインしてない場合はログイン画面に遷移
   before_action :authenticate_customer!, except: [:top, :about]

  # サインイン後の遷移
  def after_sign_in_path_for(resource)
    public_homes_path  #(current_user)
  end

 def after_sign_out_path_for(resource)
    public_homes_path
 end
   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
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

