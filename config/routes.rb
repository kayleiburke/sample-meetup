Rails.application.routes.draw do
  resources :engagements
  resources :groups do
    collection do
      post :import
    end
  end
  resources :users
  root :to => "groups#index"
end
