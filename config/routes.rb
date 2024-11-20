# config/routes.rb
Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users
  root "home#index"
end
