Rails.application.routes.draw do
  # root :to => ''
  get '/', to: 'welcome#index'
  resources :items
  resources :warehouses, only: [:index]
end
