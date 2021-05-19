class Reading < ApplicationRecord
  belongs_to :tarot_deck

  def self.Alphabetize
    order(Arel.sql("lower(spread)"))
  end

  def self.default
    order(:created_at)
  end

  def self.major_readings
    where(major_reading: true)
  end

  def self.attend(min)
    where('attendees_num >= ?', "#{min}")
  end
end
