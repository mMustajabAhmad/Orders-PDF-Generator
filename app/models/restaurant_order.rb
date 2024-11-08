class RestaurantOrder < ApplicationRecord
  belongs_to :restaurant
  has_many :restaurant_order_items, dependent: :destroy
end
