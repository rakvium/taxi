Rails.application.routes.draw do
  devise_for :dispatchers
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'orders#new'
  get 'orders/new'
end
