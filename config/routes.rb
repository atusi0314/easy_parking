Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  resources :parkings, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
end
