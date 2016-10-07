Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :dispatchers
  resources :orders
  
  root to: 'orders#new'
  get 'orders/new'

  devise_for :drivers, :path => 'drivers' 
    # devise_for :users, :controllers => { registrations: 'registrations' }
    # get '/drivers/sign_out' => 'drivers/sessions#destroy'
    # get '/drivers/sign_in' => 'drivers/sessions#new'
  

  devise_for :admins, :path => 'admins' 
    # get '/admins/sign_out' => 'adminssessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
