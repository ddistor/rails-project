# frozen_string_literal: true

class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :area
      t.string :info
      t.string :founded
      t.string :disbanded

      t.timestamps
    end
  end
end
