Rails.application.routes.draw do
  post 'oz_lottos/add'

  get 'results/:id', to: 'oz_lottos#edit_result', as: 'edit_result'
  patch 'results/:id', to: 'oz_lottos#update_result', as: 'result'

  resources :test do
    get 'oz_lottos/add'
  end

  get 'oz_lottos/generate_result'
  post 'oz_lottos/generate_result'

  resources :oz_lottos

  resources :records
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # set root route
  # root 'records#index'
  root 'oz_lottos#index', via: [:get, :post]
end
