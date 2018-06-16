class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.integer :price
      t.integer :units

      t.timestamps
    end
  end
end
