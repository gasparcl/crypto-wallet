Rails.application.routes.draw do
  resources :mining_types
  get 'app', to: 'spa#index'
  get 'app/*path', to: 'spa#index'
  get 'welcome/index'
  resources :coins

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
