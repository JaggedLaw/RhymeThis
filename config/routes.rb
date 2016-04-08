Rails.application.routes.draw do

  root to: 'games#index'

  # get 'game/show'

  resources :players, only: [:new, :create]
  resources :games, only: [:show, :create, :new]
end
