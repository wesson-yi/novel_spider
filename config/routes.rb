require 'api_constraints'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'static_pages#home'

  # get 'static_pages/home'
  # get '/static_pages/home'
  # get '/home'

  get '/help',    to: 'static_pages#help' # , as: 'helf'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  resources :books
  resources :users, only: [:show, :index, :edit]

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :books, only: [:index]
      resources :chapters, only: [:create]
    end
  end
end
