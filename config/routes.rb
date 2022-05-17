Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  resources :items
  resources :warehouses
end
