Rails.application.routes.draw do
  get 'notifications/index'

  get 'relationships/create'
  get 'relationships/destroy'

  root 'top#index'

  resources :poems, only: [:index, :show]

  resources :relationships, only: [:create, :destroy]


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index, :show]
  resources :contacts, only: [:new, :create]do
    collection do
      post :confirm
    end
  end

  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy, :show]do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end

  resources :conversations do
    resources :messages
  end
end
