class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :hours
      t.float :latitude
      t.float :longitutde

      t.timestamps
    end
  end
end
