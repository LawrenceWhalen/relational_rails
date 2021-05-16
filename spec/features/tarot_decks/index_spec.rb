require 'rails_helper'

RSpec.describe 'the Tarot Deck index' do
  it 'displays all the Tarot Decks Names' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )
    deck2 = TarotDeck.create!(
      name: 'Witches',
      number_made: 1,
      pre_owned: true,
      )


    visit "/tarot_decks"

    expect(page).to have_content(deck.name)
    expect(page).to have_content(deck2.name)
  end
  it 'displays the decks in the order of creation and displays the creation date.' do
    deck1 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      )
    deck2 = TarotDeck.create!(
      name: 'AAA',
      number_made: 15,
      pre_owned: false,
      )

    deck3 = TarotDeck.create!(
      name: 'Witches',
      number_made: 1,
      pre_owned: false,
      )


    visit "/tarot_decks"


    expect(page).to have_content(deck1.created_at)
    expect(page).to have_content(deck2.created_at)
    expect(page).to have_content(deck3.created_at)
    expect(page.find('h3:nth-child(1)')).to have_content(deck1.name)
    expect(page.find('h3:nth-child(2)')).to have_content(deck2.name)
    expect(page.find('h3:nth-child(3)')).to have_content(deck3.name)
  end
end
