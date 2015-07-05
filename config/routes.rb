Rails.application.routes.draw do
  
  resources :teams do
    get '/rosters/:roster_id/users/:id/destroy', to: 'rosters#remove_user', as: :remove_user
    post '/rosters/:roster_id/users', to: 'rosters#add_user', as: :add_user
    get '/rosters/:roster_id/join', to: 'rosters#join', as: :roster_join
  end

  root 'pages#news'
  
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :tournaments
  
  resources :users

  resources :leagues
end
