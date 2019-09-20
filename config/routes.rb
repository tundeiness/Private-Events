Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'landing_pages#home'
  get '/home', to: 'landing_pages#home'
  get '/event', to: 'landing_pages#event'
 
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
