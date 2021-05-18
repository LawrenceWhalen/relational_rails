class ReadingsController < ApplicationController
  def index
    @readings = Reading.all
  end

  def new

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
      interpretation: params[:interpretation]
      })
    reading.save

    redirect_to '/readings'
  end
end
