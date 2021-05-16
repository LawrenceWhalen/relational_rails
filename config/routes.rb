Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crystal_sets', to: 'crystal_sets#index'
  get '/crystal_sets/new', to: 'crystal_sets#new'
  get '/crystal_sets/:id', to:'crystal_sets#show'
  get '/crystal_sets/:crystal_set_id/crystals', to: 'set_crystals#index'
  
  get '/crystals', to: 'crystals#index'
  get '/crystals/:id', to: 'crystals#show'
end
