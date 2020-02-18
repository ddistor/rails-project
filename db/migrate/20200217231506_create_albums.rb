# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :label
      t.datetime :release_date
      t.references :band, null: true, foreign_key: true
      t.references :artist, null: true, foreign_key: true

      t.timestamps
    end
  end
end
