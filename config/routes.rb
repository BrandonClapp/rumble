Rails.application.routes.draw do

  root 'pages#news'
  devise_for :users
  resources :tournaments
  resources :teams
  resources :users
  resources :leagues
end
