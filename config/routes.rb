Rails.application.routes.draw do
  
  resources :teams do
    get '/rosters/:roster_id/user/:id/destroy', to: 'rosters#remove_user', as: :remove_user
  end

  root 'pages#news'
  
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :tournaments
  
  resources :users

  resources :leagues
end
