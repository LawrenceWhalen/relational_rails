require 'rails_helper'

RSpec.describe Reading, type: :model do
  it {should belong_to :tarot_deck}

  it 'has a default order' do
    @deck_1 = TarotDeck.create!(name: 'Programs', number_made: 15, pre_owned: false)

    reading_1 = @deck_1.readings.create(
      spread: 'Three Card',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed'
    )
    reading_2 = @deck_1.readings.create(
      spread: 'Five Card',
      major_reading: false,
      cards_drawn: 'Fool Maji',
      attendees_num: 18,
      interpretation: 'I will live'
    )

    expect(@deck_1.readings.default).to eq([reading_1, reading_2])
  end
end
