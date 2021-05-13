require 'rails_helper'

RSpec.describe 'the Tarot Deck index' do
  it 'displays all the Tarot Decks Names' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )
    deck2 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )


    visit "/tarot_decks"

    expect(page).to have_content(deck.name)
    expect(page).to have_content(deck2.name)
  end
end
