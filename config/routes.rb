Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :update] do
      resources :skills, only: [:create]
      resources :projects, only: [:create]
      resources :experiences, only: [:create]
      end
      resources :skills, only: [:show, :update, :destroy]
      resources :projects, only: [:show, :update, :destroy]
      resources :experiences, only: [:show, :update, :destroy]
      post "/skills", to: "skills#update_positions"
      post "/projects", to: "projects#update_positions"
      post "/experiences", to: "experiences#update_positions"
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :update] do
    resources :skills, only: [:create]
    resources :projects, only: [:create]
    resources :experiences, only: [:create]
    get "/showcase", to: "users#showcase"
  end
  resources :skills, only: [:update, :destroy]
  resources :projects, only: [:update, :destroy]
  resources :experiences, only: [:update, :destroy]
end
