Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  get 'artwork/illustration_new', to: 'artworks#illustration_new', as: 'illustration_new'
  get 'artwork/music_new', to: 'artworks#music_new', as: 'music_new'

  resources :users, only: [:show, :edit, :update]
  resources :artworks, only: [:create]
end
