Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  namespace :admin do
    get '/' => 'homes#top'
  end
  
  
  scope module: :user do
    get '/' => 'homes#top'
    root to: "homes#top"
    resources :notifications, only: :index
    resources :homes, only: [:top, :about]
    resources :users
    resources :books do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end
