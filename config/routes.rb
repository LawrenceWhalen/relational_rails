Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/tarot_decks', to: 'tarot_decks#index'
  get '/tarot_decks/new', to: 'tarot_decks#new'
  get '/tarot_decks/:id', to: 'tarot_decks#deck'
  post '/tarot_decks', to: 'tarot_decks#create'
  get '/readings', to: 'readings#index'
  get '/readings/new', to: 'readings#new'
  get '/readings/:id', to: 'readings#reading'
  post '/readings', to: 'readings#create'
  get '/tarot_decks/:id/readings', to: 'tarot_decks#children'
  
  get '/crystal_sets', to: 'crystal_sets#index'
  get '/crystal_sets/new', to: 'crystal_sets#new'
  post '/crystal_sets', to: 'crystal_sets#create'
  get '/crystal_sets/:id', to:'crystal_sets#show'
  get '/crystal_sets/:id/edit', to: "crystal_sets#edit"
  patch '/crystal_sets/:id', to: 'crystal_sets#update'
  delete '/crystal_sets/:id', to: 'crystal_sets#destroy'

  get '/crystal_sets/:id/crystals', to: 'set_crystals#index'
  get '/crystal_sets/:id/crystals/new', to: 'set_crystals#new'
  post '/crystal_sets/:id/crystals', to: 'set_crystals#create' 

  get '/crystals', to: 'crystals#index'
  get '/crystals/:id', to: 'crystals#show'
  get '/crystals/:id/edit', to: 'crystals#edit'
  patch '/crystals/:id', to: 'crystals#update'
end
