Rails.application.routes.draw do

  resources :tournaments
  root 'pages#news'
  devise_for :users

  #root 'teams#index'
  resources :teams
  resources :users
  resources :leagues
end
