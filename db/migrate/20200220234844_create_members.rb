class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
