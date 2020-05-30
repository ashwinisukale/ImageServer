Rails.application.routes.draw do
  resources :game_logs
  resources :game_logs, only: [:create, :index]
  root "images#index"
  resources :images, only: [:create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
