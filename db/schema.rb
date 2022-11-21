# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_21_163954) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "full_name"
    t.string "billing_address"
    t.string "shipping_address"
    t.string "country"
    t.boolean "access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id_id", null: false
    t.integer "product_id_id", null: false
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id_id"], name: "index_order_details_on_order_id_id"
    t.index ["product_id_id"], name: "index_order_details_on_product_id_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id_id", null: false
    t.decimal "amount"
    t.string "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id_id"], name: "index_orders_on_customer_id_id"
  end

  create_table "soaps", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.decimal "weight"
    t.integer "stock"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_soaps_on_category_id"
  end

  add_foreign_key "order_details", "order_ids"
  add_foreign_key "order_details", "product_ids"
  add_foreign_key "orders", "customer_ids"
  add_foreign_key "soaps", "categories"
end
