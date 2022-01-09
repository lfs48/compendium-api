Rails.application.routes.draw do

  resources :users, only: [:show]

  resource :auth do
    post 'login'
    post 'register'
  end

  resources :classes, controller: 'dnd_classes', only: [:show, :create, :update, :destroy]

end
