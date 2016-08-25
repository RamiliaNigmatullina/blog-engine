Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :profiles
  resources :subscriptions

  resources :posts do
    resources :comments
  end

  resources :blogs, only: %i(index show)

  namespace :users do
    resources :blogs, only: %i(new create edit update destroy)
  end

  root to: "pages#home"
end
