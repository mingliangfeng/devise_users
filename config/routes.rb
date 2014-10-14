DeviseUsers::Engine.routes.draw do

  root to: 'devise_users#active_users'

  resources :devise_users, path: :users, as: :users do
    collection do
      get 'search'
    end
  end

end
