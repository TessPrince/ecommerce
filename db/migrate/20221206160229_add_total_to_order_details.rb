class AddTotalToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :total, :decimal
  end
end
