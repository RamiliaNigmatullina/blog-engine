Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :subscriptions
  resources :blogs do
    resources :posts do
      resources :comments
    end
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
