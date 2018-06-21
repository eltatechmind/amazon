class RemoveYourcountryFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :yourcountry, :string
  end
end
