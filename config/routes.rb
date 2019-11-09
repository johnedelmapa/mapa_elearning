Rails.application.routes.draw do
  root 'staticpages#home'
  get '/about', to: 'staticpages#about'
  get   '/signup', to: 'users#new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
