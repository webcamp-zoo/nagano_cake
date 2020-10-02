Rails.application.routes.draw do

  devise_for :admins,
  controllers: {
  	sessions: 'devise/admins/sessions'
  }

  devise_for :customers,
  controllers: {
  	passwords: 'devise/customers/passwords',
  	registrations: 'devise/customers/registrations',
  	sessions: 'devise/customers/sessions'
  }
  namespace :admin do
  	resources :product_genres, only: [:index,:create,:edit,:update]
  	resources :products, only: [:new,:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
