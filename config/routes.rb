Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'


  resources :users

  resources :users do
    resources :trucks do
      resources :menus
    end
  end

end
