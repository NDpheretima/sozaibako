Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:show, :edit, :update]
  resources :artworks, only: [:index, :show, :create, :edit, :update, :destroy]
end
