class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :area
      t.datetime :founded
      t.datetime :disbanded

      t.timestamps
    end
  end
end
