# config/routes.rb
Rails.application.routes.draw do
  resources :users
  root "home#index"  # Esto hace que la ruta raíz cargue la acción index de HomeController
end
