class AddUserToMenus < ActiveRecord::Migration[5.0]
  def change
    add_reference :menus, :user, foreign_key: true
  end
end
