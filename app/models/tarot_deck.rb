class TarotDeck < ApplicationRecord
  has_many :readings, dependent: :destroy

  def readings
    Reading.where(tarot_deck_id: self.id)
  end

  def reading_count
    self.readings.count
  end

  def self.order_created
    order(created_at: :desc)
  end
end
