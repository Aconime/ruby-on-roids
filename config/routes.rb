Rails.application.routes.draw do
  root 'home#index'

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  delete 'delete_account', to: 'gdpr#destroy'

  resources :dashboard
  resources :events, only: %i(index show)
  resources :blogs, only: %i(index show)
  resources :leaderboard, only: :index
  resources :teams
  resources :team_requests
  resources :teams do
    get 'request', to: 'team_requests#new'
    post 'request', to: 'team_requests#create'
  end

  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    resources :users
    resources :events
    resources :blogs
  end
end
