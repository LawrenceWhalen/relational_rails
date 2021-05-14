class TarotDecksController < ApplicationController
  def index
    @tarot_decks = TarotDeck.all
  end

  def new

  end

  def deck
    @tarot_deck = TarotDeck.find(params[:id])
  end

  def create
    if params[:pre_owned] != nil
      boolean = true
    else
      boolean = false
    end
    deck = TarotDeck.new({
      name: params[:name],
      number_made: params[:number_made].to_i,
      pre_owned: boolean
      })
    deck.save

    redirect_to '/tarot_decks'
  end
end
