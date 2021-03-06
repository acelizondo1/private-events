Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get "/users/:id", to: "users#show"

  resources :events
  resources :invites, only: [:new, :create, :update, :destroy]
  root 'events#index'
end
