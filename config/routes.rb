Rails.application.routes.draw do

  devise_for :admins,
  controllers: {
  	sessions: 'devise/admins/sessions'
  }
  get 'admin/products/top'


  devise_for :customers,
  controllers: {
  	passwords: 'devise/customers/passwords',
  	registrations: 'devise/customers/registrations',
  	sessions: 'devise/customers/sessions'
  }
  namespace :admin do
  	resources :product_genres, only: [:index,:create,:edit,:update]
  	resources :products, only: [:new,:create,:index,:show,:edit,:update]
    resources :customers, only:[:index, :show]
  end

  namespace :customer do
    resources :products, only: [:index,:show]
    resources :customers, only:[:edit, :update]
    resources :cart_products, only:[:index, :create, :update, :destroy]
    get "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
    patch "/customers/:id/withdrawal" => "customers#withdrawal", as: 'customers_withdrawal'
    resources :addresses, except: [:show]
    get 'products/top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  delete '/customer/cart_products' => 'customer/cart_products#destroy_all'


end
