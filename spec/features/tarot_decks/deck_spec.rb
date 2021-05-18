require 'rails_helper'

RSpec.describe 'the Tarot Deck id page' do
  it 'displays the Tarot Deck Name' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )
    deck2 = TarotDeck.create!(
      name: 'Programs2',
      number_made: 14,
      pre_owned: true,
      )

    visit "/tarot_decks/#{deck.id}"

    expect(page).to have_content(deck.name)
    expect(page).to have_content(deck.number_made)
    expect(page).to have_content(deck.pre_owned)
    expect(page).to_not have_content(deck2.name)
    expect(page).to_not have_content(deck2.number_made)
    expect(page).to_not have_content(deck2.pre_owned)
  end
  it 'shows the number of children the parent has' do
    deck_1 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
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

    reading_3 = deck_1.readings.create(
      spread: 'Horseshoe',
      major_reading: false,
      cards_drawn: 'Taco Plant',
      attendees_num: 14,
      interpretation: 'This is not a Tarot Deck'
    )

    visit("/tarot_decks/#{deck_1.id}")

    expect(page).to have_content('Readings logged with this deck: 3')
  end
  it 'has a link to its child page' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )

    visit "/tarot_decks/#{deck.id}"

    expect(page).to have_selector("[value='View Readings']")

    click_button('View Readings')

    expect(current_path).to eq("/tarot_decks/#{deck.id}/readings")
  end
end
