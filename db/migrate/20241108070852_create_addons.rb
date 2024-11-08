class CreateAddons < ActiveRecord::Migration[7.1]
  def change
    create_table :addons do |t|
      t.string :item_name
      t.float :item_price
      t.string :instruction
      t.references :restaurant_order_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
