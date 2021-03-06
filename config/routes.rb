Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources :courses do
    collection do
      get :inform
      get :download_file
      get :search
    end

    member do
      get "like", to: "courses#upvote"
      get "dislike", to: "courses#downvote"
    end

    resources :versions, only: [:destroy] do
      member do
        get :diff, to: 'versions#diff'
        patch :rollback, to: 'versions#rollback'
      end
    end
  end

  resources :grade do
    collection do
      get :download
    end
  end

  resources :bullets

  resources :users

  namespace :admin do
    resources :courses
    resources :semesters
    resources :dashboard, only: :index
  end

  get "/pages/:action" , :controller => "pages"
end
