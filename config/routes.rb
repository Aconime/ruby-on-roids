Rails.application.routes.draw do
  root 'home#index'

  # register
  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  # login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  # logout
  delete 'logout', to: 'sessions#destroy'

  #gdpr 
  delete 'delete_account', to: 'gdpr#destroy'

  resources :dashboard

  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    resources :users
    resources :events
  end
end
