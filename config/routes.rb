Rails.application.routes.draw do
  get 'interviews/index'

  get 'interviews/new'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users do
    resources :interviews
  end
end
