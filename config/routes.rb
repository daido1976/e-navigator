Rails.application.routes.draw do
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
    resources :interviews do
      get 'apply', on: :collection
      patch 'judgement', on: :member
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/lo"
  end
end
