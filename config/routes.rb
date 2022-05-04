Rails.application.routes.draw do
  get 'users/new'
  root 'articles#index'
  get 'articles/detail', to: 'articles#detail'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get '/signup',   to: 'users#new'
  resources :users
end
