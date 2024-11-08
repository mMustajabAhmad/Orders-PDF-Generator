class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :paid_by
      t.string :card_number
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
