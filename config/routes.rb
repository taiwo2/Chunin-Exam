Rails.application.routes.draw do
  root to: "home#index"
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :web_links, only: %i[create]
end
