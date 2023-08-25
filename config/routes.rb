Rails.application.routes.draw do
  resources :users do
    resources :posts
  end
  resources :posts
  root 'users#index'
end
