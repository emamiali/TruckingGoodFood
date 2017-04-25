class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :truck, foreign_key: true

      t.timestamps
    end
  end
end
