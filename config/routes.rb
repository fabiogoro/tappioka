Rails.application.routes.draw do
  resources :recipes, only: [:new, :create, :show, :index]
  resources :cuisines, only: [:new, :create, :show]
  resources :types, only: [:new, :create, :show]
  resources :preferences, only: [:new, :create, :show]
  root 'recipes#index'
  get 'about' => 'recipes#about'
  get 'new_user_session' => 'recipes#index'
end
