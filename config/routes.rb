Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :drivers, controllers: { registrations: 'registrations' }
  devise_for :dispatchers
  resources :orders

  root to: 'orders#new'

  get 'orders/new'
end
