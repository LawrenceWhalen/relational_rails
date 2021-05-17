# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_14_004940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

   create_table "readings", force: :cascade do |t|
    t.string "spread"
    t.boolean "major_reading"
    t.string "cards_drawn"
    t.integer "attendees_num"
    t.string "interpretation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tarot_deck_id"
    t.index ["tarot_deck_id"], name: "index_readings_on_tarot_deck_id"
  end

  create_table "tarot_decks", force: :cascade do |t|
    t.string "name"
    t.integer "number_made"
    t.boolean "pre_owned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "readings", "tarot_decks"

  create_table "crystal_sets", force: :cascade do |t|
    t.string "collection_name"
    t.boolean "limited_edition"
    t.integer "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crystals", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "charged"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "crystal_set_id"
    t.index ["crystal_set_id"], name: "index_crystals_on_crystal_set_id"
  end

  add_foreign_key "crystals", "crystal_sets"
end
