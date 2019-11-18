Rails.application.routes.draw do
  namespace :admin do
    get 'words/index'
    get 'words/new'
    get 'words/create'
    get 'words/edit'
    get 'words/update'
    get 'words/destroy'
  end
  get 'sessions/new'
  root 'staticpages#home'
  get '/about', to: 'staticpages#about'
  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  delete  '/logout',   to: 'sessions#destroy'

  resources :users
  resources :sessions, only: :create

  namespace :admin do 
    get '/home', to:'users#home'
    resources :users
    resources :categories do
      resources :words
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
