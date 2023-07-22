Rails.application.routes.draw do

  # 管理者用

  # URL /admin/sign_in ...
 namespace :admin do
   get "/homes" => "homes#top"
   resources :items, only:[:index, :create, :new, :show, :edit, :update]
   resources :genres, only:[:index, :create, :edit, :update]
   resources :customers, only:[:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
 end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用

  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
# public（顧客側のルーディング）
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    # 会員
    # resources :customers, path: 'customers/information', only: [:show, :edit, :update]
    get "customers/information" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    # patch "customers/information", to: "customers#update"
    get "customers/confirm_withdraw" => "customers#confirm_withdraw"
    patch "customers/withdraw" => "customers#withdraw"
    # 商品
    resources :items, only: [:index, :show]
    # カート内商品
    resources :cart_items, only: [:create, :index, :destroy, :update] do
      collection do
        delete :destroy_all
      end
    end

    # 注文
    post "/orders/confirm" => "orders#confirm"
    get  "/orders/complete" => "orders#complete"
    resources :orders, only:[:new, :index, :show, :create]
    # 配送先
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    # ジャンル検索
    resources :genres, only:[:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
