Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
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

  resources :buyers
  resources :users do
    member do
      get 'identification'
      get 'log_out'
    end
  end
  resources :cards

  resources :sellers
end
