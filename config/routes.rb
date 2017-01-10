Rails.application.routes.draw do
  get "/tags/:q", to: "posts#index", as: "tag"

  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :subscriptions, only: %i(create destroy)

  resources :profiles, only: %i(show)
  resources :posts, only: %i(index show)
  resources :blogs, only: %i(index show)

  namespace :users do
    resources :my_feeds, only: %i(index)
    resources :blogs, only: %i(new create edit update destroy)
    resources :posts, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create destroy)
    end
  end

  resources :posts do
    resource :like, only: %i(create destroy)
  end

  authenticated :user do
    root to: "users/my_feeds#index", as: "authenticated_root"
  end

  root to: "blogs#index"
end
