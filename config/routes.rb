Rails.application.routes.draw do

  mount ActionCable.server => "/cable"

  resources :users, only: [
    :show,
    :update
  ]

  resource :auth do
    post 'login'
    post 'register'
  end

  resources :entities, only: [:index]

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

  resources :races,
  only: [
    :index,
    :show, 
    :create, 
    :update, 
    :destroy
  ]

  resources :spells,
  only: [
    :index,
    :show,
    :create,
    :update,
    :destroy
  ]

  resources :items,
  only: [
    :index,
    :show,
    :create,
    :update,
    :destroy
  ]

  resources :collections,
  only: [
    :index,
    :show,
    :create,
    :update,
    :destroy
  ]

  resources :messages,
  only: [
    :index,
    :show,
    :create
  ]

end
