Rails.application.routes.draw do
  devise_for :admins do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :dispatchers
  resources :orders
  
  root to: 'orders#new'
  get 'orders/new'
end
