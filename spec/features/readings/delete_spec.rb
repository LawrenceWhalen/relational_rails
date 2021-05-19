require 'rails_helper'

RSpec.describe 'the Reading deletion process' do
  it 'links to delete from the view page' do
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

    visit "/readings/#{reading_1.id}"

    expect(page).to have_selector("[value='Delete Reading']")

    click_button('Delete Reading')

    expect(current_path).to eq('/readings')

    expect(page).to_not have_content("I am doomed")
  end
  it 'can delete a tarot reading' do
    deck_1 = TarotDeck.create!(
      name: 'Witches',
      number_made: 1,
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

    expect(Reading.last.id).to eq(reading_2.id)

    visit "/readings/#{reading_2.id}"

    click_button('Delete Reading')

    expect(Reading.last.id).to eq(reading_1.id)
  end
end
