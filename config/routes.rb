Rails.application.routes.draw do

  devise_for :drivers, :path => 'drivers' do
    # devise_for :users, :controllers => { registrations: 'registrations' }
    # get '/drivers/sign_out' => 'drivers/sessions#destroy'
    # get '/drivers/sign_in' => 'drivers/sessions#new'
  end
  devise_for :admins, :path => 'admins' do
    # get '/admins/sign_out' => 'admins/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root :to => "orders#new" 
   get "orders/new"
end
