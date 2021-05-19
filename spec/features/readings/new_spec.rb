require 'rails_helper'

RSpec.describe 'Reading creation' do
  it 'links to the new page from the tarot deck children page' do

    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false
      )

    visit "/tarot_decks/#{deck.id}/readings"

    expect(page).to have_selector("[value='Add New Reading']")

    click_button(value: 'Add New Reading')

    expect(current_path).to eq("/tarot_decks/#{deck.id}/readings/new")
  end
  it 'can create a new child reading' do

    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false
      )

    visit "/tarot_decks/#{deck.id}/readings"

    click_button(value: 'Add New Reading')

    fill_in('Cards Drawn (sepereated by commas):', with: 'Maji')
    fill_in('People in attendance:', with: 2)
    check('Was this a major reading?')
    fill_in('Interpretation:', with: 'We will survive')
    click_button(value: 'Add Reading')


    expect(current_path).to eq("/tarot_decks/#{deck.id}/readings")
    expect(page).to have_content("Maji")
  end
end
