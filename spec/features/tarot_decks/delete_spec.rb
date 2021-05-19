require 'rails_helper'

RSpec.describe 'the Tarot Deck creation' do
  it 'links to the new page from the tarot deck index' do
    deck_1 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
    )

    visit "/tarot_decks/#{deck_1.id}"

    expect(page).to have_selector("[value='Delete Programs']")

    click_button('Delete Programs')

    expect(current_path).to eq('/tarot_decks')
  end
  it 'can delete a tarot deck' do
    deck_1 = TarotDeck.create!(
      name: 'Witches',
      number_made: 1,
      pre_owned: false,
    )
    deck_2 = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
    )

    expect(TarotDeck.last.id).to eq(deck_2.id)

    visit "/tarot_decks/#{deck_2.id}"

    click_button('Delete Programs')

    expect(TarotDeck.last.id).to eq(deck_1.id)
  end
end
