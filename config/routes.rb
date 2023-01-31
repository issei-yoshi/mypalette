Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "palettes#new"
  get "about" => "homes#about"
  get "terms_of_use" => "homes#terms"
  get "privacy_policy" => "homes#policy"

  resources :users, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :palettes, only: [:index, :new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
  end

  resources :palette_seconds, only: [:index, :new, :create, :show, :destroy] do
    resources :like_seconds, only: [:create, :destroy]
  end

  namespace :mypage do
    resource :profile, only: [:edit, :show, :update]
    get 'palettes' => 'colors#palettes'
    get 'palette_seconds' => 'color_seconds#palette_seconds'
    get "palettes/likes" => "colors#likes"
    get "palette_seconds/likes" => "color_seconds#likes"
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'

    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :colors, only: [:index, :show, :edit, :update, :destroy]
    resources :color_seconds, only: [:index, :show, :edit, :update, :destroy]
  end

  post '/guest_login', to: 'user_sessions#guest_login'
end
