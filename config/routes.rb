Rails.application.routes.draw do
  get 'username_resets/new'
  get 'username_resets/create'
  root "home#index"
  
  resources :users, only: [:new, :create] do
    get 'forgot_username', to: 'username_resets#new', as: :forgot_username
    member do
      get :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new', as: :signin
  delete 'signout', to: 'sessions#destroy', as: :signout

  resources :password_resets, only: [:new, :create, :edit, :update]
  
  # Username resets routes:
  resources :username_resets, only: [:new, :create]
  get 'forgot_username', to: 'username_resets#new', as: :forgot_username

  # Existing routes for your pages:
  get "wildlife", to: "home#wildlife"
  get "portrait", to: "home#portrait"
  get "cars", to: "home#cars"
  get "contact", to: "home#contact"
  post "contact", to: "home#contact_submit"
end
