Rails.application.routes.draw do

  root to: 'home#index'
  post 'games/check_guess'
  # get 'game/show'

  resources :players, only: [:new, :create]
  resources :games, only: [:show, :create, :new]
end
