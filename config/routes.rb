Rails.application.routes.draw do
  post 'oz_lottos/add'

  get 'oz_lottos/generate_result'
  post 'oz_lottos/generate_result'

  resources :oz_lottos

  resources :records
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # set root route
  # root 'records#index'
  root 'oz_lottos#index', via: [:get, :post]
end
