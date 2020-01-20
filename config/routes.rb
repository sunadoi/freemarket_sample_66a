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

  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :buyers, exept: [:new] do
    member do
      get 'new', to: 'buyers#new'
    end
    collection do
      post 'pay', to: 'buyers#pay'
      get 'done', to: 'buyers#done'
    end
  end

  resources :users do
    member do
      get 'identification'
      get 'log_out'
      get 'card'
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
