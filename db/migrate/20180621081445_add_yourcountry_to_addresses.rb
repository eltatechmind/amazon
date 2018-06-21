class AddYourcountryToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :yourcountry, :string
  end
end
