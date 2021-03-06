Rails.application.routes.draw do

  resources :users, only: [:show]

  resource :auth do
    post 'login'
    post 'register'
  end

  resources :features, 
  only: [
    :index,
    :show, 
    :create, 
    :update, 
    :destroy
  ]

  resources :classes, 
  controller: 'dnd_classes', 
  only: [
    :index,
    :show, 
    :create, 
    :update, 
    :destroy
  ]

end
