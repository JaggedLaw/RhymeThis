Rails.application.routes.draw do

  root to: 'game#index'

  # get 'game/show'

  resources :players, only: [:new, :create]
  resources :game, only: [:show, :create, :new]
end
