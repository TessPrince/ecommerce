class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer_id, null: false, foreign_key: true
      t.decimal :amount
      t.string :order_status

      t.timestamps
    end
  end
end
