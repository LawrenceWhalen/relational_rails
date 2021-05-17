class TarotDeck < ApplicationRecord
  has_many :readings

  def readings
    @readings = Reading.where(tarot_deck_id: self.id)
  end

  def reading_count
    self.readings.count
  end  
end
