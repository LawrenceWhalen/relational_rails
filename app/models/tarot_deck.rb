class TarotDeck < ApplicationRecord
  has_many :readings

  def readings
    @readings = Reading.where(tarot_deck_id: self.id)
  end
  
end
