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
    deck = TarotDeck.new({
      name: params[:name],
      number_made: params[:number_made].to_i,
      if params[:pre_owned] != nil
        pre_owned: true
      else
        pre_owned: false
      end
      })
    deck.save

    redirect_to '/tarot_decks'
  end
end
