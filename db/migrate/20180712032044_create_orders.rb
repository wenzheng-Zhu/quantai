class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :phone_no
      t.decimal :order_price
      t.decimal :total_point
      t.integer :bonus

      t.timestamps
    end
  end
end
