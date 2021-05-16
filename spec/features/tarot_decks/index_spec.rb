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
      created_at: '2021-05-16 00:57:47 UTC'
      )
    deck2 = TarotDeck.create!(
      name: 'AAA',
      number_made: 15,
      pre_owned: false,
      created_at: '2021-05-15 00:57:47 UTC'
      )

    deck3 = TarotDeck.create!(
      name: 'Witches',
      number_made: 1,
      pre_owned: false,
      created_at: '2021-05-14 00:57:47 UTC'
      )


    visit "/tarot_decks"

    save_and_open_page

    created_first = deck3.name
    created_second = deck2.name
    expect(page).to have_content(deck1.created_at)
    expect(page).to have_content(deck2.created_at)
    expect(page).to have_content(deck3.created_at)
    expect(created_first).to appear_before(created_second)
  end
end
