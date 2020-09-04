Rails.application.routes.draw do
  resources :user_group_roles
  resources :roles
  resources :groups
  resources :users
  root :to => "pages#main"
end
