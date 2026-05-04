class CreateSalesOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :sales_orders do |t|
      t.string :customer_name
      t.decimal :total_price

      t.timestamps
    end
  end
end
