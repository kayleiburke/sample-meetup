Rails.application.routes.draw do
  resources :engagements
  resources :groups
  resources :users
  root :to => "groups#index"
end
