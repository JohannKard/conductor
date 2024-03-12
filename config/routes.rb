Rails.application.routes.draw do
  devise_for :users
  resources :daily_overviews, only: [:show]
  resources :todos, only: [:create, :update, :destroy]
  resources :habits, only: [:create, :update, :destroy]
  resources :notes, only: [:create, :destroy]
  resources :weeks, only: [:index]
  root 'daily_overviews#show'
end