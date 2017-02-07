Rails.application.routes.draw do

  get 'oz_lottos/index'

  get 'oz_lottos/add'

  get 'oz_lottos/remove'

  get 'oz_lottos/generate_result'

  resources :records
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # set root route
  # root 'records#index'
  root 'oz_lottos#index'
end
