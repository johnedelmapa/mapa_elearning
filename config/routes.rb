Rails.application.routes.draw do
  get 'sessions/new'
  root 'staticpages#home'
  get '/about', to: 'staticpages#about'
  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  delete  '/logout',   to: 'sessions#destroy'

  resources :users
  resources :sessions, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
