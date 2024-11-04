class CreateCateringOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :catering_orders do |t|
      t.string :order_number
      t.date :order_date
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :paid_by
      t.string :card_number
      t.string :billing_address
      t.date :delivery_date
      t.string :delivery_time
      t.string :vendor
      t.string :delivery_address
      t.float :food_total
      t.float :service_fee
      t.float :delivery_fee
      t.float :tip
      t.float :tax
      t.float :grand_total
      t.string :item_quantity
      t.string :item_name
      t.text :instructions
      t.float :item_price
      t.float :item_total

      t.timestamps
    end
  end
end
