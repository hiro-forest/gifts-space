Rails.application.routes.draw do
  devise_for :users

  resources :signups, only: [:new, :create] do
    collection do
      get :user
      post :user
      get :address
      post :address
    end
  end

  root 'gifts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
