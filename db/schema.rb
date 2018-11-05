ActiveRecord::Schema.define(version: 2018_11_05_204814) do
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

end
