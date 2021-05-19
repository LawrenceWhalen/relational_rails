class Reading < ApplicationRecord
  belongs_to :tarot_deck

  def self.alphabatize
    order(:spread)
  end

  def self.default
    Reading.where(tarot_deck_id: params[:id])
  end

  def self.major_readings
    where(major_reading: true)
  end
end
