class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :label
      t.datetime :release_date
      t.references :band, null: false, foreign_key: true
      t.string :artist
      t.string :references

      t.timestamps
    end
  end
end
