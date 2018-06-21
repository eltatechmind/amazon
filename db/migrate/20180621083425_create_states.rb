class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :order_state

      t.timestamps
    end
  end
end
