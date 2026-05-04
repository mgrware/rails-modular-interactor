class CreateInventoryItems < ActiveRecord::Migration[8.1]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.integer :stock

      t.timestamps
    end
  end
end
