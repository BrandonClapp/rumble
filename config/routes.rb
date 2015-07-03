Rails.application.routes.draw do
  resources :teams
  root 'pages#news'
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :tournaments
  
  resources :users
  resources :leagues
end
