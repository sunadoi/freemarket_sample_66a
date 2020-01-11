Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    get 'tel', to: 'users/registrations#tel'
    post 'tel', to: 'users/registrations#tel'
    get 'address', to: 'users/registrations#address'
    post 'address', to: 'users/registrations#address'
    get 'card', to: 'users/registrations#card'
    post 'card', to: 'users/registrations#card'
    get 'complete', to: 'users/registrations#complete'
    post 'complete', to: 'users/registrations#complete'
  end
  root to: 'products#index'
  resources :products
  resources :users, only: [:show]
end
