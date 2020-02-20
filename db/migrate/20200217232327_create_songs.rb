class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :info
      t.integer :length
      t.integer :position
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
