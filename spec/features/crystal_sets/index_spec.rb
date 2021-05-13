#spec/features/crystal_sets/index_spec
require 'rails_helper'
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

RSpec.describe 'crystal set index' do
  #gem orderly - checks display order (expect certain text appears before other text)
  #within blocks 
  # expect(model_name.column_name).to appear_before(whatever)
  # https://github.com/jmondo/orderly
  it 'shows all crystal set collection names in order of most recently created' do 
    set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: false, inventory: 1000)
    set_2 = CrystalSet.create!(collection_name: "Intuitively Chosen Raw Crystals", limited_edition: true, inventory: 250)
    visit "/crystal_sets"

    expect(page).to have_content(set_2.created_at)
  end 
end