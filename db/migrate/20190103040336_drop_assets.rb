class DropAssets < ActiveRecord::Migration[5.2]
  def change
    drop_table :assets
  end
end
