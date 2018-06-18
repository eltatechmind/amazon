class AddItemToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :item_id, :integer
    add_index :photos, :item_id
  end
end
