class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.string :item_quantity
      t.string :item_name
      t.text :instructions
      t.float :item_price
      t.float :item_total
      t.string :labeled_as

      t.timestamps
    end
  end
end
