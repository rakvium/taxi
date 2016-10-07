Rails.application.routes.draw do

  devise_for :admins, :path => 'admins' 
  devise_for :drivers, :path => 'drivers'
  devise_for :dispatchers, :path => 'dispatchers'

  resources :orders

  root to: 'orders#new'

  get 'orders/new'
end
