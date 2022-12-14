# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_06_110040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.string "style"
    t.string "brand"
    t.string "brewery"
    t.date "date_received"
    t.boolean "priority", default: false
    t.decimal "abv", precision: 8, scale: 2
    t.decimal "price", precision: 8, scale: 2
    t.integer "serving_size"
    t.date "date_tapped"
    t.boolean "partial", default: false
    t.integer "serving_price"
    t.integer "keg_size"
    t.date "date_kicked"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_kegs", force: :cascade do |t|
    t.string "style"
    t.string "brand"
    t.string "brewery"
    t.date "date_received"
    t.boolean "priority", default: false
    t.decimal "abv", precision: 8, scale: 2
    t.decimal "price", precision: 8, scale: 2
    t.integer "serving_size"
    t.date "date_tapped"
    t.boolean "partial", default: false
    t.integer "serving_price"
    t.integer "keg_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "taps_id"
    t.index ["taps_id"], name: "index_inventory_kegs_on_taps_id"
  end

  create_table "taps", force: :cascade do |t|
    t.bigint "keg_on_id"
    t.bigint "keg_on_deck_id"
    t.string "tap_style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tap_number"
    t.index ["keg_on_deck_id"], name: "index_taps_on_keg_on_deck_id"
    t.index ["keg_on_id"], name: "index_taps_on_keg_on_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventory_kegs", "taps", column: "taps_id"
  add_foreign_key "taps", "inventory_kegs", column: "keg_on_deck_id"
  add_foreign_key "taps", "inventory_kegs", column: "keg_on_id"
end
