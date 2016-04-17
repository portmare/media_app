Rails.application.routes.draw do
  root 'main#index'

  resources :users, only: %w(new create)
  resources :user_sessions, only: %w(new create destroy)
end
