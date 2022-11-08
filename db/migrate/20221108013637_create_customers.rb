class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password
      t.string :full_name
      t.string :billing_address
      t.string :shipping_address
      t.string :country
      t.boolean :access

      t.timestamps
    end
  end
end
