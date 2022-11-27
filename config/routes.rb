Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "homes#about"
  get "about" => "homes#about"
  get "terms_of_use" => "homes#terms"
  get "privacy_policy" => "homes#policy"

  resources :users, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  namespace :admin do
    root to: 'dashboards#index'
  end
end
