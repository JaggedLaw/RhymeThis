Rails.application.routes.draw do

  root to: 'game#show'

  get 'game/show'

  resources :players, only: [:new, :create]

end
