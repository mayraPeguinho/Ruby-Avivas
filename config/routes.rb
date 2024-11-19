# config/routes.rb
Rails.application.routes.draw do
  root "home#index"  # Esto hace que la ruta raíz cargue la acción index de HomeController
end
