class AddPermitIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :permit_id, :string
  end
end
