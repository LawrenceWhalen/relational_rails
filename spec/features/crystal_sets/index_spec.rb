#spec/features/crystal_sets/index_spec
require 'rails_helper'

RSpec.describe 'crystal set index' do
  before :each do 
    @set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: false, inventory: 1000)
    @set_2 = CrystalSet.create!(collection_name: "Intuitively Chosen Raw Crystals", limited_edition: true, inventory: 250)
  end

  it 'can see all crystal sets and their creation date' do 
    visit '/crystal_sets'

    expect(page).to have_content(@set_1.collection_name)
    expect(page).to have_content(@set_1.limited_edition)
    expect(page).to have_content(@set_1.created_at.strftime('%m/%d/%y'))
  end

  it 'shows crystal sets in order of date created' do
    visit '/crystal_sets'

    full_set_name_1 = "Intuitively Chosen Raw Crystals Collection created at: #{@set_2.created_at.strftime('%m/%d/%y')}"
    full_set_name_2 = "Raw Crystal Chunks - 28pc Collection created at: #{@set_1.created_at.strftime('%m/%d/%y')}"

    expect(full_set_name_1).to appear_before(full_set_name_2, only_text: true)
  end

  it 'links to crystals index page' do
    visit '/crystal_sets'
    
    expect(page).to have_link("All Crystals", href: '/crystals')
  end

  it 'links to each sets show page' do
    visit '/crystal_sets'

    expect(page).to have_link("#{@set_1.collection_name}", href: "/crystal_sets/#{@set_1.id}")
    expect(page).to have_link("#{@set_2.collection_name}", href: "/crystal_sets/#{@set_2.id}")
  end
end