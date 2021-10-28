Rails.application.routes.draw do
  get 'aims/index'
  root 'layers#index'
  resources :layers
  resources :aims, only: %i[index]
  resources :boards
end
