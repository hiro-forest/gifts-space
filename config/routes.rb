Rails.application.routes.draw do
  devise_for :users

  resources :signups, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      get :user
      post :user
      get :address
      post :address
    end
  end

  resources :hopes, only: [:new, :show, :create, :edit, :update, :destroy] do

  end

  resources :gifts, only: [:index] do

  end

  resources :profiles, only: [:new, :show, :create, :edit, :update, :destroy] do

  end

  root 'gifts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
