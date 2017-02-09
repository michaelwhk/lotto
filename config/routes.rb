Rails.application.routes.draw do

  get 'oz_lottos/index'
  post 'oz_lottos/index'

  get 'oz_lottos/add'

  delete 'oz_lottos/remove/:id', to: 'oz_lottos#remove', as: 'remove_lotto'

  get 'oz_lottos/generate_result'

  resources :records
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # set root route
  # root 'records#index'
  root 'oz_lottos#index', via: [:get, :post]
end
