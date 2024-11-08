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

ActiveRecord::Schema[7.1].define(version: 2024_11_08_070852) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addons", force: :cascade do |t|
    t.string "item_name"
    t.float "item_price"
    t.string "instruction"
    t.bigint "restaurant_order_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_order_item_id"], name: "index_addons_on_restaurant_order_item_id"
  end

  create_table "catering_orders", force: :cascade do |t|
    t.string "order_number"
    t.date "order_date"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "paid_by"
    t.string "card_number"
    t.string "billing_address"
    t.date "delivery_date"
    t.string "delivery_time"
    t.string "vendor"
    t.string "delivery_address"
    t.float "food_total"
    t.float "service_fee"
    t.float "delivery_fee"
    t.float "tip"
    t.float "tax"
    t.float "grand_total"
    t.string "item_quantity"
    t.string "item_name"
    t.text "instructions"
    t.float "item_price"
    t.float "item_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.date "delivery_date"
    t.string "delivery_time"
    t.string "vendor"
    t.string "delivery_address"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.string "item_quantity"
    t.string "item_name"
    t.text "instructions"
    t.float "item_price"
    t.float "item_total"
    t.string "labeled_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number"
    t.date "order_date"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "billing_address"
    t.float "food_total"
    t.float "service_fee"
    t.float "delivery_fee"
    t.float "tip"
    t.float "tax"
    t.float "grand_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "paid_by"
    t.string "card_number"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "restaurant_order_items", force: :cascade do |t|
    t.string "employee_name"
    t.string "item_name"
    t.float "food_total"
    t.float "tip"
    t.float "tax"
    t.float "user_contri"
    t.float "office_contri"
    t.boolean "cutlery"
    t.integer "bags"
    t.bigint "restaurant_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_order_id"], name: "index_restaurant_order_items_on_restaurant_order_id"
  end

  create_table "restaurant_orders", force: :cascade do |t|
    t.date "order_date"
    t.string "meal"
    t.string "status"
    t.integer "items_count"
    t.integer "cutlery_count"
    t.integer "bags_count"
    t.float "food_total"
    t.float "tip"
    t.float "tax"
    t.float "grand_total"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_orders_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addons", "restaurant_order_items"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "order_items", "orders"
  add_foreign_key "payments", "orders"
  add_foreign_key "restaurant_order_items", "restaurant_orders"
  add_foreign_key "restaurant_orders", "restaurants"
end
