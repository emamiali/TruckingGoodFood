class AddTruckToLocations < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :truck, foreign_key: true
  end
end
