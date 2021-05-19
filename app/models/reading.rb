class Reading < ApplicationRecord
  belongs_to :tarot_deck

  def self.alphabatize
    order(:spread)
  end

  def self.default
    order(:created_at)
  end

  def self.major_readings
    where(major_reading: true)
  end
end
