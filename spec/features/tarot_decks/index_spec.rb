require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    deck = TarotDeck.create!(
      name: 'Programs',
      number_made: 15,
      pre_owned: false,
      major_readings: 'First schoolday, First love'
      )

    visit "/tarot_decks"

    expect(page).to have_content(deck.name)
  end
end
