class RemoveNumberFromPhones < ActiveRecord::Migration[5.1]
  def change
    remove_column :phones, :number, :integer
  end
end
