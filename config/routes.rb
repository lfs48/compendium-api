Rails.application.routes.draw do

  resources :users, only: [:show]

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

  resources :chats,
  only: [
    :index
  ]

  resources :messages,
  only: [
    :show,
    :create
  ]

end
