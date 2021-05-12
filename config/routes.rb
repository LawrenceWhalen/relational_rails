Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crystal_sets', to: 'crystal_sets#index'
  get '/crystal_sets/:id', to:'crystal_sets#show'
  get '/crystals', to: 'crystals#index'
  get '/crystals/:id', to: 'crystals#show'
end
