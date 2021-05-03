Rails.application.routes.draw do
  get 'shorts/index'
  root 'static_pages#home'
  resources :shorts, only: [:show, :create, :new]
  resources :advertisements
  get ":id", to: "static_pages#redirect"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
