require 'rails_helper'

RSpec.describe 'the Reading index' do
  it 'displays all the Readings and their informations' do
    @deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false
      )

    @reading_1 = @deck.readings.create!(
      spread: 'Three Card',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed'
    )
    @reading_2 = @deck.readings.create!(
      spread: 'Celtic Cross',
      major_reading: true,
      cards_drawn: 'Six of Wands Seven of Pentacles',
      attendees_num: 1,
      interpretation: 'Looks good'
    )

    visit "/readings"

    expect(page).to have_content(@reading_1.spread)
    expect(page).to have_content(@reading_1.major_reading)
    expect(page).to have_content(@reading_1.cards_drawn)
    expect(page).to have_content(@reading_1.attendees_num)
    expect(page).to have_content(@reading_1.interpretation)
    expect(page).to have_content(@reading_2.spread)
    expect(page).to have_content(@reading_2.major_reading)
    expect(page).to have_content(@reading_2.cards_drawn)
    expect(page).to have_content(@reading_2.attendees_num)
    expect(page).to have_content(@reading_2.interpretation)
  end
  it 'displays only readings with a true boolean' do
    @deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false
      )

    @reading_1 = @deck.readings.create!(
      spread: 'Three Card',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed'
    )
    @reading_2 = @deck.readings.create!(
      spread: 'Celtic Cross',
      major_reading: false,
      cards_drawn: 'Six of Wands Seven of Pentacles',
      attendees_num: 1,
      interpretation: 'Looks good'
    )

    visit "/readings"

    expect(page).to have_content(@reading_1.spread)
    expect(page).to have_content(@reading_1.major_reading)
    expect(page).to have_content(@reading_1.cards_drawn)
    expect(page).to have_content(@reading_1.attendees_num)
    expect(page).to have_content(@reading_1.interpretation)
    expect(page).to_not have_content(@reading_2.spread)
    expect(page).to_not have_content(@reading_2.major_reading)
    expect(page).to_not have_content(@reading_2.cards_drawn)
    expect(page).to_not have_content(@reading_2.attendees_num)
    expect(page).to_not have_content(@reading_2.interpretation)
  end
end
