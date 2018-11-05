class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :rank
      t.string :symbol
      t.float :supply
      t.float :max_supply
      t.float :market_cap_usd
      t.float :price_usd
      t.string :percent_change_24_hr
      t.float :market_cap_usd
    end
  end
end
