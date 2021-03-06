Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/tarot_decks', to: 'tarot_decks#index'
  get '/tarot_decks/new', to: 'tarot_decks#new'
  post '/tarot_decks', to: 'tarot_decks#create'
  get '/tarot_decks/:id/edit', to: 'tarot_decks#edit'
  get '/tarot_decks/:id/readings', to: 'tarot_decks#children'
  get '/tarot_decks/:id', to: 'tarot_decks#deck'
  patch '/tarot_decks/:id', to: 'tarot_decks#update'
  delete '/tarot_decks/:id', to: 'tarot_decks#destroy'

  get '/readings/new', to: 'readings#new'
  get '/readings', to: 'readings#index'
  get '/readings/:id', to: 'readings#reading'
  post '/readings', to: 'readings#create'
  get '/tarot_decks/:id/readings/new', to: 'readings#new'
  patch '/readings/:id', to: 'readings#update'
  get '/readings/:id/edit', to: 'readings#edit'
  delete '/readings/:id', to: 'readings#destroy'

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
  delete '/crystal_sets/:id/crystals', to: 'sets_crystals#destroy'


  get '/crystals', to: 'crystals#index'
  get '/crystals/:id', to: 'crystals#show'
  get '/crystals/:id/edit', to: 'crystals#edit'
  patch '/crystals/:id', to: 'crystals#update'
  delete '/crystals/:id', to: 'crystals#destroy'
end
