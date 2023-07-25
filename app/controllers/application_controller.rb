class ApplicationController < ActionController::Base

  # 顧客ログイン後の遷移先（トップ）
  def after_sign_in_path_for(resource)
    case resource
      when Customer
        root_path
    end
  end

  # ログアウト後の遷移先（トップ）
  def after_sign_out_path_for(resource)
    root_path
  end

end
