Rails.application.routes.draw do
  # Root path
  root "home#index"
  
  # User routes
  resources :users, only: [:new, :create] do
    member do
      get :confirm
    end
  end

  # Session routes for sign in/out
  resources :sessions, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new', as: :signin
  delete 'signout', to: 'sessions#destroy', as: :signout

  # Password reset routes (if you have them)
  resources :password_resets, only: [:new, :create, :edit, :update]

  # Username reset routes
  resources :username_resets, only: [:new, :create]
  get 'forgot_username', to: 'username_resets#new', as: :forgot_username

  # Additional static pages
  get "wildlife", to: "home#wildlife"
  get "portrait", to: "home#portrait"
  get "cars", to: "home#cars"
  get "contact", to: "home#contact"
  post "contact", to: "home#contact_submit"
end