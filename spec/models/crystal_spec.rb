require 'rails_helper'

RSpec.describe Crystal do
  it {should belong_to :crystal_set}

  describe "methods" do
    before :each do 
      @set = CrystalSet.create!(collection_name: "Starter Set 4 Stones", limited_edition: false, inventory: 100)
      @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
      @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
      @amethyst= @set.crystals.create!(name: "Ametheyst", price: 12.99, charged: false, description: "Stress Relief/Protection")
    end

    it '::show_only_true' do
      
      expect(Crystal.show_only_true).to eq([@larimar, @emerald]) 
    end

    it '::orders_aphabetically' do

     expect(Crystal.order_alphabetically).to eq([@amethyst, @emerald, @larimar]) 
    end
  end
end