Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :comments
  resources :subscriptions

  resources :profiles, only: %i(show)
  resources :posts, only: %i(index show)
  resources :blogs, only: %i(index show)

  namespace :users do
    resources :blogs, only: %i(new create edit update destroy)
    resources :posts, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create destroy)
    end
  end

  root to: "pages#home"
end
