Rails.application.routes.draw do
  root to: "home#index"
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]

  namespace :app do
    resources :web_links, only: %i[index create show]
  end

  get "/:id", to: "web_links#show", as: :external_web_link
end
