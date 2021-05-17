require 'rails_helper'

RSpec.describe 'the universal menu' do
  it 'displays a menu for all pages' do

    visit "/tarot_decks"

    expect(page).to have_selector(:css, 'a[href="/tarot_decks"]')
    expect(page).to have_selector(:css, 'a[href="/readings"]')

    visit "/readings"

    expect(page).to have_selector(:css, 'a[href="/tarot_decks"]')
    expect(page).to have_selector(:css, 'a[href="/readings"]')
  end
end
