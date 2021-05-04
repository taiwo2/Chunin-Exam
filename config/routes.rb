Rails.application.routes.draw do
  devise_for :users
  get 'shorts/index'
  root 'static_pages#home'
  resources :shorts, only: %i[show create new]
  get ':id', to: 'static_pages#redirect'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
