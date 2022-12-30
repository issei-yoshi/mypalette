Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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

  #追加
  resources :palette_seconds, only: [:index, :new, :create, :show, :destroy]

  namespace :mypage do
    resource :profile, only: [:edit, :show, :update]
    get 'palettes' => 'colors#palettes'
    get 'palette_seconds' => 'color_seconds#palette_seconds'
    get "palettes/likes" => "colors#likes"
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  namespace :admin do
    # root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'

    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :colors, only: [:index, :show, :edit, :update, :destroy]
  end
end
