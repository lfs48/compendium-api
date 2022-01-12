Rails.application.routes.draw do

  resources :users, only: [:show]

  resource :auth do
    post 'login'
    post 'register'
  end

  resources :features, 
  only: [
    :show, 
    :create, 
    :update, 
    :destroy
  ]

  post '/features/:id/sources', to: 'features#create_source'
  delete '/features/:id/sources', to: 'features#destroy_source'

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
