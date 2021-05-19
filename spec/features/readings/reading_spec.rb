require 'rails_helper'

RSpec.describe 'the Tarot Deck id page' do
  it 'displays the Tarot Deck Name' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
    )

    reading_1 = deck.readings.create(
      spread: 'Three Card',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed'
    )
    reading_2 = deck.readings.create(
      spread: 'Five Card',
      major_reading: false,
      cards_drawn: 'Fool Maji',
      attendees_num: 18 ,
      interpretation: 'I will live'
    )

    visit "/readings/#{reading_1.id}"

    expect(page).to have_content(reading_1.spread)
    expect(page).to have_content(reading_1.major_reading)
    expect(page).to have_content(reading_1.cards_drawn)
    expect(page).to have_content(reading_1.attendees_num)
    expect(page).to have_content(reading_1.interpretation)
    expect(page).to_not have_content(reading_2.spread)
    expect(page).to_not have_content(reading_2.major_reading)
    expect(page).to_not have_content(reading_2.cards_drawn)
    expect(page).to_not have_content(reading_2.attendees_num)
    expect(page).to_not have_content(reading_2.interpretation)
  end
end
