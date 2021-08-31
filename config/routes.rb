Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end
  resources :users do
    get :follow, on: :member
    get :follower, on: :member
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
end
