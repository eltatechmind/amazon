class AddAddressToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :address_id, :integer
    add_index :orders, :address_id
  end
end
