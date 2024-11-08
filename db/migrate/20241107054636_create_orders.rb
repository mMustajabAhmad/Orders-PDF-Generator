class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.date :order_date
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :billing_address
      t.float :food_total
      t.float :service_fee
      t.float :delivery_fee
      t.float :tip
      t.float :tax
      t.float :grand_total

      t.timestamps
    end
  end
end
