Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#about"
  get "about" => "homes#about"

  resources :users, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
