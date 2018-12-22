Rails.application.routes.draw do

  devise_for :users
  get '/tops' => 'tops#top'
  get '/home/about' => 'tops#about', as: 'about'

  root 'tops#top'


  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end

