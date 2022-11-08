class CreateSoaps < ActiveRecord::Migration[7.0]
  def change
    create_table :soaps do |t|
      t.string :name
      t.decimal :price
      t.decimal :weight
      t.integer :stock

      t.timestamps
    end
  end
end
