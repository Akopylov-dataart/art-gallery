Rails.application.routes.draw do
  get 'artists', to: 'artists#index', format: :json

  resources :artworks, except: [:edit, :destroy]
  root 'artworks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
