Rails.application.routes.draw do

  devise_for :drivers
  devise_for :admins, :path => 'admins' do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root :to => "orders#new" 
   get "orders/new"
end
