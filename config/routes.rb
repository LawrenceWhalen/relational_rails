Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crystal_sets', to: 'crystal_sets#index'
  get '/crystals', to: 'crystals#index'
end
