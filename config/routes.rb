Rails.application.routes.draw do

  resources :users, only: [:create, :show]

  resource :auth, only: [:create]

end
