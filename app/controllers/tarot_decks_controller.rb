class TarotDecksController < ApplicationController
  def index
    @tarot_decks = TarotDeck.all
  end

  def new

  end

  def create
    deck = TarotDeck.new({
      name: params[:name],
      number_made: params[:number_made],
      pre_owned: params[:pre_owned],
      })
    deck.save

    redirect_to '/tarot_decks'
  end
end
