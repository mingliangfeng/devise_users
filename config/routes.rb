DeviseUsers::Engine.routes.draw do

  root to: 'devise_users#active_users'

  get 'all' => 'devise_users#index'
  get 'search' => 'devise_users#search'

end
