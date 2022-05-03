Rails.application.routes.draw do
  root 'articles#index'
  get 'articles/detail', to: 'articles#detail'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
end
