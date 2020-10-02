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


	get 'customer/products/top'

end
