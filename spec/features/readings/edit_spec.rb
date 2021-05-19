require 'rails_helper'

RSpec.describe 'the readings edit process' do
  it 'has an edit button on the view page' do
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

    visit "/readings/#{reading_1.id}"

    expect(page).to have_selector("[value='Update Reading']")

    click_button('Update Reading')

    expect(current_path).to eq("/readings/#{reading_1.id}/edit")
  end
  it 'updates the reading' do
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

    visit "/readings/#{reading_1.id}/edit"

    expect(page).to_not have_content("Maji")

    fill_in('Cards Drawn (sepereated by commas):', with: 'Maji')

    click_button('Update Reading')

    expect(current_path).to eq("/readings/#{reading_1.id}")

    expect(page).to have_content("Maji")
  end
end
