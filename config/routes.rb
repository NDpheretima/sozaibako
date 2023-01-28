Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  get 'artwork/illustration_new', to: 'artworks#illustration_new', as: 'illustration_new'
  get 'artwork/music_new', to: 'artworks#music_new', as: 'music_new'

  get 'artwork/:id/illustration_edit', to: 'artworks#illustration_edit', as: 'illustration_edit'
  get 'artwork/:id/music_edit', to: 'artworks#music_edit', as: 'music_edit'
  
  resources :users, only: [:show, :edit, :update]
  resources :artworks, only: [:create, :update]
end
