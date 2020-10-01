Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :customers

  get 'products/top' => 'products#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
