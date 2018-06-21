class AddUserToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :user_id, :integer
    add_index :addresses, :user_id
  end
end
