Rails.application.routes.draw do
  
  resources :teams do
    get '/users/:id/destroy', to: 'teams#remove_user', as: :user_remove
  end

  root 'pages#news'
  
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :tournaments
  
  resources :users

  resources :leagues
end
