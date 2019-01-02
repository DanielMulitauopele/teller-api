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

ActiveRecord::Schema.define(version: 2019_01_02_224047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.string "symbol"
    t.float "supply"
    t.float "max_supply"
    t.float "market_cap_usd"
    t.float "price_usd"
    t.string "percent_change_24_hr"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "name"
    t.float "price_usd"
    t.string "percent_change_24_hr"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "favorites", "users"
end
