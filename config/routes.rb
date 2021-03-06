Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :recipes do
    member do
      post 'favourite'
      delete 'favourite'
      post 'mail'
    end
  end
  resources :cuisines, only: [:new, :create, :show, :index] do
    member do
      post 'like'
      delete 'like'
    end
  end
  resources :types, only: [:new, :create, :show]
  resources :preferences, only: [:new, :create, :show]
  root 'recipes#index'
  get 'about' => 'recipes#about'
end
