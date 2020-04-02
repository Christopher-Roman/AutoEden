# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_31_154757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.boolean "feeding_day"
    t.boolean "watering_day"
    t.boolean "defoil"
    t.boolean "training_applied"
    t.float "water_ph_levels"
    t.float "soil_ph_levels"
    t.string "nutrients_used"
    t.integer "temp"
    t.integer "relative_humidity"
    t.string "training"
    t.text "explanation"
    t.text "notes"
    t.bigint "journal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_entries_on_journal_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "garden_name"
    t.string "garden_type"
    t.string "garden_medium"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gardens_on_user_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "journal_name"
    t.string "journal_type"
    t.boolean "archive"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "plant_name"
    t.string "plant_type"
    t.string "growth_state"
    t.boolean "flowering"
    t.bigint "garden_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garden_id"], name: "index_plants_on_garden_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "user_email"
    t.integer "gardening_experience"
    t.string "nickname"
    t.string "preferred_pronoun"
    t.string "favorite_plant"
    t.string "pref_gardening_medium"
    t.string "country"
    t.string "state_or_province"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_email"], name: "index_users_on_user_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "entries", "journals"
  add_foreign_key "gardens", "users"
  add_foreign_key "journals", "users"
  add_foreign_key "plants", "gardens"
end
