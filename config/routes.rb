Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tarot_decks', to: 'tarot_decks#index'
  get '/tarot_decks/new', to: 'tarot_decks#new'
  get '/tarot_decks/:id', to: 'tarot_decks#deck'
  post '/tarot_decks', to: 'tarot_decks#create'
  get '/readings', to: 'readings#index'
  get '/readings/new', to: 'readings#new'
  post '/readings', to: 'readings#create'
end
