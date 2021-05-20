class TarotDecksController < ApplicationController

  def index

    if params[:children] == true
      @children = true
      @tarot_decks = TarotDeck.order
    else
      @children = false
      @tarot_decks = TarotDeck.all.order_created
    end
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
    TarotDeck.create!({
    name: params[:name],
    number_made: params[:number_made].to_i,
    pre_owned: boolean
    })

    redirect_to "/tarot_decks"
  end

  def children
    @deck = TarotDeck.find(params[:id])
    if params[:commit] == 'Alphabetize'
      @readings = @deck.readings.Alphabetize
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
    if params[:pre_owned] != nil
      boolean = true
    else
      boolean = false
    end
    deck = TarotDeck.find(params[:id])
    deck.update(name: params[:name])
    deck.update(number_made: params[:number_made].to_i)
    deck.update(pre_owned: boolean)
    redirect_to "/tarot_decks"
  end

  def destroy
    tarot_deck = TarotDeck.find(params[:id])
    tarot_deck.destroy
    redirect_to '/tarot_decks'
  end
end
