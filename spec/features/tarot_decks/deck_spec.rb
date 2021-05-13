require 'rails_helper'

RSpec.describe 'the Tarot Deck id page' do
  it 'displays the Tarot Deck Name' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )

    visit "/tarot_decks/#{deck.id}"

    expect(page).to have_content(deck.name)
    expect(page).to have_content(deck.number_made)
    expect(page).to have_content(deck.pre_owned)
  end
end
