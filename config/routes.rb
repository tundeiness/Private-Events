Rails.application.routes.draw do
  
  root 'landing_pages#home'

  get 'sessions/new'
  get 'users/new'
  
  get '/home', to: 'landing_pages#home'
  get '/event', to: 'events#show'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'

  get '/newevent', to: 'events#new'
  post '/newevent', to: 'events#create'
  resources :users
  resources :events, only: [:index, :show, :create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
