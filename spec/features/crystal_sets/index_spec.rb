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

  it 'can see all crystal sets and their creation date' do 
    set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: false, inventory: 1000)

    visit '/crystal_sets'

    expect(page).to have_content(set.collection_name)
    expect(page).to have_content(set.limited_edition)
    expect(page).to have_content(set.created_at.strftime('%m/%d/%y'))
  end

  it 'shows crystal sets in order of date created' do
    visit '/crystal_sets'

    expect("Intuitively Chosen Raw Crystals Collection").to appear_before("Raw Crystal Chunks - 28pc Collection", only_text: true)
  end
end