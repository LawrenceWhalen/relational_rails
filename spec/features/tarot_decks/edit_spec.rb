require 'rails_helper'

RSpec.describe 'updating a Tarot Deck' do
  it 'links to the edit page from deck page' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false
      )

    visit "/tarot_decks/#{deck.id}"

    expect(page).to have_selector("[value='Update Deck']")

    click_button('Update Deck')

    expect(current_path).to eq("/tarot_decks/#{deck.id}/edit")
  end
  it 'can edit a tarot deck' do
    deck = TarotDeck.create!(
      name: 'Huntters',
      number_made: 15,
      pre_owned: false
      )

    visit "/tarot_decks/#{deck.id}/edit"

    fill_in('Deck Name', with: 'Hunters')

    click_button('Update Deck')

    expect(current_path).to eq("/tarot_decks")
    expect(page).to have_content("Hunters")
  end
end
