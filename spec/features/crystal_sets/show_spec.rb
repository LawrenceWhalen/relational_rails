#spec/features/crystal_sets/show_spec.rb
require 'rails_helper'

RSpec.describe 'the crystal set show page' do
  it 'displays collection and attributes' do
    set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    set_2 = CrystalSet.create!(collection_name: "Moonlight ", limited_edition: false, inventory: 10)
    visit "/crystal_sets/#{set_1.id}"
    save_and_open_page    

    expect(page).to have_content(set_1.collection_name)
    expect(page).to have_content(set_1.limited_edition)
    expect(page).to have_content(set_1.inventory)
    expect(page).to_not have_content(set_2.collection_name)
  end
end