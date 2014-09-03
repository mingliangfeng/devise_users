Rails.application.routes.draw do

  mount DeviseUsers::Engine => "/devise_users"
end
