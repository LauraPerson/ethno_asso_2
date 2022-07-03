Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "about", to: "pages#about"
  get "support", to: "pages#support"
  get "contact", to: "pages#contact"
  get "home", to: "pages#contact"
  resources :articles
  resources :ressources
  resources :dashboard, :controller => 'users'

end
