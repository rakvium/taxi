Rails.application.routes.draw do
  devise_for :drivers do
    get '/drivers/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :admins do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root :to => "orders#new" 
   get "orders/new"
end
