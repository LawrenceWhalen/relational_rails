class RemoveMajorReadingsFromTarotDecks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tarot_decks, :major_readings, :string
  end
end
