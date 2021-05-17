Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  # Tarot Deck - Tarot Reading
  get '/tarot_decks', to: 'tarot_decks#index'
  get '/tarot_decks/new', to: 'tarot_decks#new'
  post '/tarot_decks', to: 'tarot_decks#create'
  
  # Crystal Set - Crystals
  get '/crystal_sets', to: 'crystal_sets#index'
  get '/crystal_sets/:id', to:'crystal_sets#show'
  get '/crystal_sets/:crystal_set_id/crystals', to: 'set_crystals#index'
  
  get '/crystals', to: 'crystals#index'
  get '/crystals/:id', to: 'crystals#show'

end
