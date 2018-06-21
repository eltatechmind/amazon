class RemoveCountryFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :country, :string
  end
end
