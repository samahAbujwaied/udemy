Rails.application.routes.draw do
  # resources :articles , anly: [:show]
  root 'pages#index'
  get 'pages/about'
  resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
