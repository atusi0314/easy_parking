Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users
  root to: "homes#top"
  resources :maps, only: [:index]
  resources :parkings, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
end
