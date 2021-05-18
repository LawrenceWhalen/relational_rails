class TarotDecksController < ApplicationController

  def index
    @tarot_decks = TarotDeck.order(:created_at)
  end

  def new

  end

  def deck
    @tarot_deck = TarotDeck.find(params[:id])
  end

  def create
    TarotDeck.create!({
    name: params[:name],
    number_made: params[:number_made].to_i,
    pre_owned: params[:pre_owned]
    })

    redirect_to "/tarot_decks"
  end

  def children
    @deck = TarotDeck.find(params[:id])
    @readings = Reading.where(tarot_deck_id: params[:id])
  end

  def edit
    @deck = TarotDeck.find(params[:id])
  end

  def update
    deck = TarotDeck.find(params[:id])
    deck.update(name: params[:name])
    deck.update(number_made: params[:number_made].to_i)
    deck.update(pre_owned: params[:pre_owned])
    redirect_to "/tarot_decks"
  end
end
