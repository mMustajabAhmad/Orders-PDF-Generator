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

ActiveRecord::Schema[7.1].define(version: 2024_11_04_123109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
