Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tarot', to: 'tarot#index'
  get '/tarot/new', to: 'tarot#new'
  post '/tarot', to: 'tarot#create'
end
