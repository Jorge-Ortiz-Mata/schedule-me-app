Rails.application.routes.draw do
  resources :projects
  # User Authentication routes.
  resources :users, only: %i[create] do
    resources :profiles
  end
  get '/signup', to: 'users#new'
  get '/users/:token_id', to: 'users#show', as: 'user'
  get '/users/edit/:token_id', to: 'users#edit', as: 'edit_user'
  patch '/users/edit/:token_id', to: 'users#update', as: 'update_user'
  delete '/users/destroy/:token_id', to: 'users#destroy', as: 'destroy_user'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'
  get '/email/confirmation/:token_id', to: 'users#confirm_account', as: 'confirm_user_account'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
end
