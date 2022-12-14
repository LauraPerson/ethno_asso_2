Rails.application.routes.draw do
  get 'partners/new'
  get 'partners/index'
  devise_for :users
  root to: "pages#home"

  get "about", to: "pages#about"
  get "support", to: "pages#support"
  get "contact", to: "pages#contact"
  get "home", to: "pages#contact"

  resources :articles do 
    member do 
      patch 'archive'
    end
  end
  
  resources :presentations, only: [:edit, :update]
  resources :partners
  resources :ressources
  resources :dashboard, :controller => 'users'
  resources :users, only: [:index, :destroy] do 
    member do 
      patch 'archive'
    end
  end

  resources :contacts, only: [:new, :create]



end
