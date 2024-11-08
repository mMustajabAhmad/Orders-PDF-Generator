class CreateRestaurantOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_order_items do |t|
      t.string :employee_name
      t.string :item_name
      t.float :food_total
      t.float :tip
      t.float :tax
      t.float :user_contri
      t.float :office_contri
      t.boolean :cutlery
      t.integer :bags
      t.references :restaurant_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
