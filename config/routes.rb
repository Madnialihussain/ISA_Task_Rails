Rails.application.routes.draw do
  resources :jobs
  resources :movies
  resources :stats

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
  # config/routes.rbRails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end


