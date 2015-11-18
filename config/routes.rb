Rails.application.routes.draw do
  delete '/sessions', to: 'sessions#destroy'	
  root 'sessions#new' 

  resources :users
  resources :cards
  resources :sessions
  resources :user_cards
end
