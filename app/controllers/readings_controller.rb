class ReadingsController < ApplicationController
  def index
    @readings = Reading.all
  end

  def new
  end

  def create
    reading = Reading.new({
      spread: params[:spread],
      if params[:major_reading] != nil
        major_reading: true
      else
        major_reading: false
      end,
      cards_drawn: params[:cards_drawn].split(' ,'),
      attendees_num: params[:attendees_num].to_i
      interpretation: params[:interpretation]
      })
    reading.save

    redirect_to '/readings'
  end
end
