class AddThecountryToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :thecountry, :string
  end
end
