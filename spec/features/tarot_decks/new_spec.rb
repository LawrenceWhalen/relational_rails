require 'rails_helper'

RSpec.describe 'new tarot deck' do
  it 'has a form for a new deck' do

    visit "/tarot_decks"

    expect(page).to have_selector(:css, 'a[href="/tarot_decks"]')
    expect(page).to have_selector(:css, 'a[href="/readings"]')

    visit "/readings"

    expect(page).to have_selector(:css, 'a[href="/tarot_decks"]')
    expect(page).to have_selector(:css, 'a[href="/readings"]')
  end
end

it 'has a link to create a new deck' do

  visit '/tarot_decks'



  click_button('Register New Deck')

  expect(current_path).to eq("/tarot_decks/new")
end

RSpec.describe 'the Tarot Deck creation' do
  it 'links to the new page from the tarot deck index' do
    visit '/tarot_decks'

    page.should have_selector("[value='Register New Deck']")

    click_link('New Artist')

    expect(current_path).to eq('/tarot_decks/new')
  end
  it 'can create a new tarot deck' do
    visit '/tarot_decks/new'
    fill_in('Deck Name', with: 'Hunters')
    fill_in('Number Made', with: 6)
    fill_in('Pre-Owned', with: true)
    click_button('Add Deck')

    new_deck_id = TarotDeck.last.id
    expect(current_path).to eq("/tarot_decks/#{new_deck_id}")
    expect(page).to have_content("Hunters")
  end
end
