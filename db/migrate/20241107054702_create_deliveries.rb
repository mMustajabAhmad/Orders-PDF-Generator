class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.date :delivery_date
      t.string :delivery_time
      t.string :vendor
      t.string :delivery_address
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
