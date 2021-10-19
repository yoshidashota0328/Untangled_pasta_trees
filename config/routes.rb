Rails.application.routes.draw do
  get 'aims/index'
  resources :layers
  resources :aims, only: %i[index]
  resources :boards
end
