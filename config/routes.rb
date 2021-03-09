Rails.application.routes.draw do
  resources :microposts
  resources :users
  resources :microposts
  root 'application#hello'
end
