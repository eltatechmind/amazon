class AddBalanceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :balance, :integer, default: 1000
  end
end
