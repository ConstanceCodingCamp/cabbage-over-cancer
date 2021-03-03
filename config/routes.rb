Rails.application.routes.draw do
  devise_for :users
  resources :businesses
  get 'home/about'
  # root 'home#index'
  root 'businesses#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
