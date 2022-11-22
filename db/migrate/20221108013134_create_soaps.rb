class CreateSoaps < ActiveRecord::Migration[7.0]
  def change
    create_table :soaps do |t|
      t.string :name
      t.decimal :price
      t.decimal :weight
      t.integer :stock
      t.string :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
