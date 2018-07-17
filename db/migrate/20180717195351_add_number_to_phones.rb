class AddNumberToPhones < ActiveRecord::Migration[5.1]
  def change
    add_column :phones, :number, :string
  end
end
