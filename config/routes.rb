Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  resources :users
end
