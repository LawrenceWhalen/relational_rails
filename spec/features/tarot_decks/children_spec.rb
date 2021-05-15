require 'rails_helper'

RSpec.describe 'the Tarot Deck children table' do
  it 'displays the readings associated with that deck' do
    deck_1 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
    )

    deck_2 = TarotDeck.create!(
      name: 'Witches',
      number_made: 200,
      pre_owned: true,
    )

    reading_1 = deck_1.readings.create(
      spread: 'Three Card',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed'
    )
    reading_2 = deck_1.readings.create(
      spread: 'Five Card',
      major_reading: false,
      cards_drawn: 'Fool Maji',
      attendees_num: 18,
      interpretation: 'I will live'
    )

    reading_3 = deck_2.readings.create(
      spread: 'Horseshoe',
      major_reading: false,
      cards_drawn: 'Taco Plant',
      attendees_num: 14,
      interpretation: 'This is not a Tarot Deck'
    )

    visit "/tarot_decks/#{deck_1.id}/readings"
    save_and_open_page

    expect(page).to have_content(reading_1.spread)
    expect(page).to have_content(reading_1.major_reading)
    expect(page).to have_content(reading_1.cards_drawn)
    expect(page).to have_content(reading_1.attendees_num)
    expect(page).to have_content(reading_1.interpretation)
    expect(page).to have_content(reading_2.spread)
    expect(page).to have_content(reading_2.major_reading)
    expect(page).to have_content(reading_2.cards_drawn)
    expect(page).to have_content(reading_2.attendees_num)
    expect(page).to have_content(reading_2.interpretation)
    expect(page).to_not have_content(reading_3.id)
  end
end
