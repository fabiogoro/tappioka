Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:new, :create, :show, :index, :edit, :update]
  resources :cuisines, only: [:new, :create, :show]
  resources :types, only: [:new, :create, :show]
  resources :preferences, only: [:new, :create, :show]
  root 'recipes#index'
  get 'about' => 'recipes#about'
end
