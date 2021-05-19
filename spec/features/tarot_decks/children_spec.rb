require 'rails_helper'

RSpec.describe 'the Tarot Deck children table' do
  before :each do
    @deck_1 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
    )

    @deck_2 = TarotDeck.create!(
      name: 'Witches',
      number_made: 200,
      pre_owned: true,
    )

    @reading_1 = @deck_1.readings.create(
      spread: 'Three Card',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed'
    )
    @reading_2 = @deck_1.readings.create(
      spread: 'Five Card',
      major_reading: false,
      cards_drawn: 'Fool Maji',
      attendees_num: 18,
      interpretation: 'I will live'
    )

    @reading_3 = @deck_2.readings.create(
      spread: 'Horseshoe',
      major_reading: false,
      cards_drawn: 'Taco Plant',
      attendees_num: 14,
      interpretation: 'This is not a Tarot Deck'
    )
  end
  it 'displays the readings associated with that deck' do
    visit "/tarot_decks/#{@deck_1.id}/readings"

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
    expect(page).to_not have_content(@reading_3.id)
  end
  it 'has a button to arrange readings alphabetically' do
    visit "/tarot_decks/#{@deck_1.id}/readings"

    expect(page).to have_selector("[value='Alphabetize']")

    click_button('Alphabetize')

    expect(current_path).to eq("/tarot_decks/#{@deck_1.id}/readings")
  end
  it 'Alphabetizes all the children' do
    @reading_4 = @deck_1.readings.create(
      spread: 'ZZZ',
      major_reading: false,
      cards_drawn: 'Taco Plant',
      attendees_num: 14,
      interpretation: 'This is not a Tarot Deck'
    )
    @reading_5 = @deck_1.readings.create(
      spread: 'AAA',
      major_reading: false,
      cards_drawn: 'Taco Plant',
      attendees_num: 14,
      interpretation: 'This is not a Tarot Deck'
    )
    visit "/tarot_decks/#{@deck_1.id}/readings"

    click_button('Alphabetize')
    
    expect('AAA').to appear_before('ZZZ')
  end
  it 'has an edit button on the view page' do

    visit "/tarot_decks/#{@deck_1.id}/readings"

    expect(page).to have_selector("[value='Update Reading ##{@reading_1.id}']")

    within("li#0") do
      click_button('Update Reading')
    end

    expect(current_path).to eq("/readings/#{@reading_1.id}/edit")
  end
  it 'has return threshhold button' do
    visit "/tarot_decks/#{@deck_1.id}/readings"

    expect(page).to have_selector("[value='Submit']")
  end
  it 'only shows readings with more than the submitted attendees' do
    visit "/tarot_decks/#{@deck_1.id}/readings"

    fill_in('Only show readings with at least', with: 16)

    click_button('Submit')

    expect(current_path).to eq("/tarot_decks/#{@deck_1.id}/readings")

    expect(page).to_not have_content('Three Card')
    expect(page).to have_content('Five Card')
  end
end
