class RemoveColumnsFromTruck < ActiveRecord::Migration[5.0]
  def change
    remove_column :trucks, :address, :string
    remove_column :trucks, :general_hours, :string
    remove_column :trucks, :longitude, :float
    remove_column :trucks, :latitude, :float
  end
end
