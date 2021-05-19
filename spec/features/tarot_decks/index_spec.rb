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


    visit '/tarot_decks'

    created_first = deck2.name
    created_second = deck3.name
    expect(page).to have_content(deck1.created_at)
    expect(page).to have_content(deck2.created_at)
    expect(page).to have_content(deck3.created_at)
    expect(created_first).to appear_before(created_second)
  end
  it 'has buttons to edit the decks' do
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

    expect(page).to have_selector("[value='Update Programs']")
    expect(page).to have_selector("[value='Update Witches']")

    click_button('Update Programs')

    expect(current_path).to eq("/tarot_decks/#{deck.id}/edit")
  end
  it 'has a button to delete the decks' do
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

    visit '/tarot_decks'

    expect(page).to have_selector("[value='Delete Programs']")
    expect(page).to have_selector("[value='Delete Witches']")

    click_button('Delete Programs')

    expect(current_path).to eq("/tarot_decks")
    expect(page).to have_content('Witches')
    expect(page).to_not have_selector('Programs')
  end
  xit 'has a button to sort by children' do
    deck_2 = TarotDeck.create!(
      name: 'Witches',
      number_made: 200,
      pre_owned: true,
    )

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
      interpretation: 'I will live',
      created_at: '2020-01-01'
    )

    reading_3 = deck_2.readings.create(
      spread: 'Horseshoe',
      major_reading: false,
      cards_drawn: 'Taco Plant',
      attendees_num: 14,
      interpretation: 'This is not a Tarot Deck',
      created_at: '2021-01-01'
    )

    visit '/tarot_decks'

    expect(deck_1.name).to appear_before(deck_2.name)
    expect(page).to have_selector("[value='Order by Readings']")

    click_button('Order by Readings')

    expect(current_path).to eq("/tarot_decks")
  end
end
