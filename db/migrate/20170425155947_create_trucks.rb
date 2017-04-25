class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.string :truck_name
      t.string :phone_number
      t.string :address
      t.float :long
      t.float :lat
      t.boolean :is_cash_only
      t.string :picture
      t.string :info
      t.string :category
      t.string :general_hours

      t.timestamps
    end
  end
end
