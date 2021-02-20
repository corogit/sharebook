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
    resources :homes, only: [:top, :about]
  end
end
