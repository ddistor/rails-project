class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :area
      t.datetime :birth
      t.datetime :death

      t.timestamps
    end
  end
end
