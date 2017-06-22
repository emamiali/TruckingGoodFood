Rails.application.routes.draw do
  root to: 'trucks#index'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/trucks', to: 'trucks#index'

  resources :users

  resources :trucks do
    resources :menus
  end

  resources :trucks do
    resources :locations
  end

end
