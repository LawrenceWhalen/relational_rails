class TarotDecksController < ApplicationController

  def index
    @tarot_decks = TarotDeck.all.order_created
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
    if params[:commit] == 'Alphabatize'
      @readings = @deck.readings.alphabatize
    elsif params[:attendees] != nil
      @readings = @deck.readings.attend(params[:attendees])
    else
      @readings = @deck.readings.default
    end
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

  def destroy
    tarot_deck = TarotDeck.find(params[:id])
    tarot_deck.destroy
    redirect_to '/tarot_decks'
  end
end
