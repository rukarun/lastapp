Rails.application.routes.draw do
  # ホームページを『app\views\pages\home.html.erb』に設定
  root 'pages#home'

  get 'pages/home'

  devise_for :users

  resources :users

  resources :rooms
  resources :rooms do
    resources :reservations
  end

  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
