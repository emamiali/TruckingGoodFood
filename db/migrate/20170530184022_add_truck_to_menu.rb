class AddTruckToMenu < ActiveRecord::Migration[5.0]
  def change
    add_reference :menus, :truck, foreign_key: true
  end
end
