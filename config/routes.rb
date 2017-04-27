Rails.application.routes.draw do
  root to: 'users#index'

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/trucks', to: 'trucks#index', as: 'trucks'
  get '/trucks/new', to: 'trucks#new', as: 'new_trucks'
  post '/trucks', to: 'trucks#create'
  get '/trucks/:id', to: 'trucks#show', as: 'truck'
  get '/trucks/:id/edit', to: 'trucks#edit', as: 'edit_trucks'
  patch '/trucks/:id', to: 'trucks#update'
  delete '/trucks/:id', to: 'trcuks#delete'

  get '/trucks/:id/menus', to: 'menus#index', as: 'menus'
  get '/trucks/:id/menus/new', to: 'menus#new', as: 'new_menu'
  post '/trucks/:id/menus', to: 'menus#create'
  get '/trucks/:id/menus/:id', to: 'menus#show', as: 'menu'
  get '/trucks/:id/menus/:id/edit', to: 'menus#edit', as: 'edit_menu'
  patch '/trucks/:id/menus/:id', to: 'menus#update'
  delete '/trucks/:id/menus/:id', to: 'menus#delete'
end
