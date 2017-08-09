class RemoveLongitutdeFromLocation < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :longitutde, :float
  end
end
