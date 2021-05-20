# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TarotDeck.destroy_all
Reading.destroy_all

deck = TarotDeck.create!(name: 'Programs', number_made: 15, pre_owned: false)
deck.readings.create!(spread: 'Three Card', major_reading: true, cards_drawn: 'Empress Fool', attendees_num: 6, interpretation: 'I am doomed')
deck.readings.create!(spread: 'Celtic Cross', major_reading: false, cards_drawn: 'Six of Wands Seven of Pentacles', attendees_num: 1, interpretation: 'Looks good')

CrystalSet.destroy_all
Crystal.destroy_all 

@set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: false, inventory: 1000)
@set_2 = CrystalSet.create!(collection_name: "Intuitively Chosen Raw Crystals", limited_edition: true, inventory: 250)
@larimar = @set_1.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
@emerald = @set_1.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
@obsidian = @set_1.crystals.create!(name: "Obsidian", price: 4.75, charged: true, description: "Protection/Purification/Grounding")
@amethyst = @set_2.crystals.create!(name: "Amethyst", price: 12.99, charged: false, description: "Peace of mind/Protection")
@howlite = @set_2.crystals.create!(name: "Howlite", price: 50.99, charged: true, description: "Surrender/Letting Go of Attachments")
@rose_quartz = @set_2.crystals.create!(name: "Rose Quartz", price: 4.00, charged: false, description: "Love/Trust/Emotional Healing")
@chrysocolla = @set_2.crystals.create!(name: "Chrysocolla", price: 15.00, charged: true, description: "Wisdom/Communication/Gentle Power")