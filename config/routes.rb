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

  resources :dashboard
end
