Rails.application.routes.draw do
  root 'entries#index'
  get 'entries/index'
  get 'entries/show'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'

  # resources :feeds do
  #   member do
  #     resources :entries, only: [:index, :show]
  #   end
  # end

  resources :entries
  resources :users
end
