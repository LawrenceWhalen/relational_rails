class AddTarotDeckstoReadings < ActiveRecord::Migration[5.2]
  def change
    add_reference :readings, :tarot_deck, foreign_key: true
  end
end
