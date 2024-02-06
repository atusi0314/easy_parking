Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :maps, only: [:index]
  resources :parkings, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
end
