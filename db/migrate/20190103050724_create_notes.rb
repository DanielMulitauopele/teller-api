class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.references :user, foreign_key: true
    end
  end
end
