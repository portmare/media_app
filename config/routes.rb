Rails.application.routes.draw do
  root 'main#index'

  resources :users, only: %i(new create)
  resources :albums, except: :show do
    resources :media, only: %i(new create destroy), shallow: true
  end

  get 'sign_in', to: 'user_session#new'
  post 'sign_in', to: 'user_session#create'
  delete 'sign_out', to: 'user_session#destroy'

  resources :token_keys, only: [:show, :update], param: :token, path: 'shared'
end
