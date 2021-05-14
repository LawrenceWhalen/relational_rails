class ReadingsController < ApplicationController
  def index
    @readings = Reading.all
  end

  def new
  end

  def create
    if params[:major_reading] != nil
      boolean = true
    else
      boolean = false
    end
    reading = Reading.new({
      spread: params[:spread],
      major_reading: boolean,
      cards_drawn: params[:cards_drawn].split(',').to_s,
      attendees_num: params[:attendees_num].to_i,
      interpretation: params[:interpretation]
      })
    reading.save

    redirect_to '/readings'
  end
end
