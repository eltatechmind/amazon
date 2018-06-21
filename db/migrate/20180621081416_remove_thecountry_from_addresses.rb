class RemoveThecountryFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :thecountry, :string
  end
end
