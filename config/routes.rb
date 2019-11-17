Rails.application.routes.draw do
  root to: 'pages#home'

  resources :flashcards, only: [:index, :show]
  resources :translations, only: [:index, :create, :show]
end
