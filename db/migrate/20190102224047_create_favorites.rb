class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.float :price_usd
      t.string :percent_change_24_hr
      t.references :user, foreign_key: true
    end
  end
end
