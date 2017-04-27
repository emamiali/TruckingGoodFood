class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :food
      t.string :description
      t.string :price
      t.boolean :is_special

      t.timestamps
    end
  end
end
