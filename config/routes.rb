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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :admin do
    resources :customers, only:[:index]
  end

  namespace :admin do
    resources :customers, only:[:show]
  end
  
  namespace :customer do
    resources :customers, only:[:edit, :update]
    get "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
    patch "/customers/:id/withdrawal" => "customers#withdrawal", as: 'customers_withdrawal'
  end


  get 'customer/products/top'

  namespace :customer do
    resources :products, only:[:show]
    resources :cart_products, only:[:index, :create, :update, :destroy]
  end

  delete '/customer/cart_products' => 'customer/cart_products#destroy_all'

end
