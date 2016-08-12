Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :subscriptions
  resources :posts do
    resources :comments
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
