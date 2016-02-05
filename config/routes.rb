Rails.application.routes.draw do
  root 'recipes#index'
  get 'about' => 'recipes#about'
  get 'new_user_session' => 'recipes#index'
end
