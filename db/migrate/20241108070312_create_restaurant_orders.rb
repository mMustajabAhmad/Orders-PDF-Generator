class CreateRestaurantOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_orders do |t|
      t.date :order_date
      t.string :meal
      t.string :status
      t.integer :items_count
      t.integer :cutlery_count
      t.integer :bags_count
      t.float :food_total
      t.float :tip
      t.float :tax
      t.float :grand_total
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
