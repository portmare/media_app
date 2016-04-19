Rails.application.routes.draw do
  root 'main#index'

  resources :users, only: %w(new create)
  resources :albums

  get 'sign_in', to: 'user_session#new'
  post 'sign_in', to: 'user_session#create'
  delete 'sign_out', to: 'user_session#destroy'
end
