class AddItemToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_id, :integer
    add_index :order_items, :item_id
  end
end
