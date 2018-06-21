class AddStateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :state_id, :integer
    add_index :orders, :state_id
  end
end
