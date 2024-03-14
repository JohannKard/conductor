Rails.application.routes.draw do
  devise_for :users
  resources :daily_overviews, only: [:show]
  resources :todos, only: [:create, :update, :destroy]
  resources :habits, only: [:create, :update, :destroy]
  resources :habit_completions, only: [:update]
  resources :notes, only: [:create, :destroy]
  resources :weeks, only: [:index, :create, :update, :destroy]
  resources :notes_history, only: [:index, :show]
  root 'daily_overviews#show', id: Date.today.to_s
end