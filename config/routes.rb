Rails.application.routes.draw do
  root 'entries#index'
  get 'entries/index'
  get 'entries/show'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :entries
  resources :users
  resources :comments, only: [:create, :destroy]

  resources :entries do
    resources :comments, only: [:create]
  end

  resources :entries do
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :users do
    resources :bookmarks, only: [:index]
  end
end
