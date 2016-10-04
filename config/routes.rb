Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
	resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root :to => "orders#new" 
   get "orders/new"
>>>>>>> fa2a78f30af90dc6b315686372173eeef445c8fc
end
