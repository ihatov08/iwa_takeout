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

ActiveRecord::Schema.define(version: 2020_04_17_140817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "prefecture_id", null: false
    t.string "name", null: false
    t.string "name_en", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id", "name", "name_en"], name: "index_cities_on_prefecture_id_and_name_and_name_en", unique: true
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.string "main_image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_foods_on_listing_id"
  end

  create_table "gallery_images", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.string "image", null: false
    t.integer "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_gallery_images_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "category_id", null: false
    t.string "postal_code", null: false
    t.bigint "prefecture_id", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.string "title", null: false
    t.string "hours"
    t.string "holidays"
    t.string "tel"
    t.string "website_url"
    t.text "description", null: false
    t.string "main_image"
    t.boolean "published", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["city_id"], name: "index_listings_on_city_id"
    t.index ["client_id"], name: "index_listings_on_client_id"
    t.index ["prefecture_id"], name: "index_listings_on_prefecture_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
    t.index ["name_en"], name: "index_prefectures_on_name_en", unique: true
  end

  add_foreign_key "cities", "prefectures"
  add_foreign_key "foods", "listings"
  add_foreign_key "gallery_images", "listings"
  add_foreign_key "listings", "categories"
  add_foreign_key "listings", "cities"
  add_foreign_key "listings", "clients"
  add_foreign_key "listings", "prefectures"
end
