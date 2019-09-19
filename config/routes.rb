Rails.application.routes.draw do
  get 'users/new'
  root 'landing_pages#home'
  get '/home', to: 'landing_pages#home'
  get '/event', to: 'landing_pages#event'
  get '/signin', to: 'landing_pages#signin'
  get '/signup', to: 'landing_pages#signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
