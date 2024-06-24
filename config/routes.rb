Rails.application.routes.draw do
  resources :posts
  resources :followeds, only: [:create, :destroy]
  resources :followers, only: [:create, :destroy]
  resources :comments, only: [:new, :create, :destroy]

  post "likes/:post_id" => "likes#create", as: :like_post
  delete "likes/:post_id" => "likes#destroy", as: :unlike_post

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
end
