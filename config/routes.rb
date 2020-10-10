Rails.application.routes.draw do

  devise_for :admins,
  controllers: {
  	sessions: 'devise/admins/sessions'
  }
  # get 'admin/products/top'
  get 'products/top'=>"products#top"


  devise_for :customers,
  controllers: {
  	passwords: 'devise/customers/passwords',
  	registrations: 'devise/customers/registrations',
  	sessions: 'devise/customers/sessions'
  }
  namespace :admin do
    get 'products/top'=>"products#top"
  	resources :product_genres, only: [:index,:create,:edit,:update]
  	resources :products, only: [:new,:create,:index,:show,:edit,:update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update] do
      collection do
        get :today_order_index
      end
    end
    resources :order_products, only:[:update]
  end

  namespace :customer do
    root 'customers#top'
    patch "/customers/withdrawal" => "customers#withdrawal", as: 'customers_withdrawal'
    get 'orders/log'=>"orders#log"
    get 'orders/thanx'=>"orders#thanx"
    get 'products/top'
    get "/customers/hide" => "customers#hide", as: 'customers_hide'
    get 'products/about'
    resources :products, only: [:index,:show]
    resources :products, only: [:index,:show]
    resources :customers, only:[:show, :edit, :update]
    resources :cart_products, only:[:index, :create, :update, :destroy]
    resources :addresses, except: [:show]
    resources :orders, only: [:new, :create, :show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  delete '/customer/cart_products' => 'customer/cart_products#destroy_all'


end
