Rails.application.routes.draw do
  root to: 'application#index'
  
  devise_for :users
  mount DeviseUsers::Engine => "/devise_users"
end
