class ReadingsController < ApplicationController
  def index
    @readings = Reading.where(:major_reading => true)
  end

  def new
    @deck = TarotDeck.find(params[:id])
  end

  def reading
    @reading = Reading.find(params[:id])
  end

  def create
    reading = Reading.new({
      spread: params[:spread],
      major_reading: params[:major_reading],
      cards_drawn: params[:cards_drawn].split(',').to_s,
      attendees_num: params[:attendees_num].to_i,
      interpretation: params[:interpretation],
      tarot_deck_id: params[:tarot_deck_id]
      })
    reading.save

    redirect_to "/tarot_decks/#{reading.tarot_deck_id}/readings"
  end

  def edit
    @reading = Reading.find(params[:id])
  end

  def update
    reading = Reading.find(params[:id])
    reading.update(spread: params[:spread])
    reading.update(cards_drawn: params[:cards_drawn].split(',').to_s)
    reading.update(major_reading: params[:major_reading])
    reading.update(attendees_num: params[:attendees_num].to_i)
    reading.update(interpretation: params[:interpretation])
    redirect_to "/readings/#{reading.id}"
  end
end
