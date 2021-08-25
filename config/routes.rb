Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  resources :recipes
  resources :users do
    member do
      get :following, :followers
  end
end
resources :relationships, only: [:create, :destroy]

end
