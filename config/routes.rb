Rails.application.routes.draw do
  
  get 'words/index'
  root 'staticpages#home'
  get '/about', to: 'staticpages#about'
  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  delete  '/logout',   to: 'sessions#destroy'

  resources :users
  resources :sessions, only: :create
  resources :relationships

  namespace :admin do 
    get '/home', to:'users#home'
    resources :users
    resources :categories do
      resources :words
    end
  end

  resources :categories, only: [:index]
  resources :lessons, only: [:create, :show] do 
    resources :answers
  end

  resources :words, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
