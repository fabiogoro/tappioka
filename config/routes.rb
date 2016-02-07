Rails.application.routes.draw do
  resources :recipes, only: [:new, :create, :show, :index]
  resources :cuisines, only: [:new, :create]
  root 'recipes#index'
  get 'about' => 'recipes#about'
  get 'new_user_session' => 'recipes#index'
end
