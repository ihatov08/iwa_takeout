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

ActiveRecord::Schema.define(version: 2020_04_10_022127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_of_weeks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_day_of_weeks_on_name", unique: true
  end

  create_table "listing_holidays", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "day_of_week_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_of_week_id"], name: "index_listing_holidays_on_day_of_week_id"
    t.index ["listing_id"], name: "index_listing_holidays_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name", null: false
    t.string "tel"
    t.text "description"
    t.string "postal_code"
    t.string "address"
    t.string "open_at"
    t.string "close_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "listing_holidays", "day_of_weeks"
  add_foreign_key "listing_holidays", "listings"
end
