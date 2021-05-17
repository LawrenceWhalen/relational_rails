Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tarot_decks', to: 'tarot_decks#index'
  get '/tarot_decks/new', to: 'tarot_decks#new'
  post '/tarot_decks', to: 'tarot_decks#create'
  get '/tarot_decks/:id/readings', to: 'tarot_decks#children'
  get '/tarot_decks/:id', to: 'tarot_decks#deck'
  get '/readings', to: 'readings#index'
  get '/readings/new', to: 'readings#new'
  get '/readings/:id', to: 'readings#reading'
  post '/readings', to: 'readings#create'
  patch '/tarot_decks/:id', to: 'tarot_decks#update'
  get '/tarot_decks/:id/edit', to: 'tarot_decks#edit'
end
