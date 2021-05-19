Rails.application.routes.draw do
  devise_for :users
  resources :engagements
  resources :groups do
    collection do
      post :import
    end
  end
  resources :users
  root :to => "groups#index"
end
