ActiveRecord::Schema.define(version: 2019_01_03_050724) do
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.string "name"
    t.float "price_usd"
    t.string "percent_change_24_hr"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "notes", "users"
end
