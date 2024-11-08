class OrderItem < ApplicationRecord
  belongs_to :order
  
  validates :item_quantity, :item_name, :item_price, :item_total, presence: true
end