class RestaurantOrderItem < ApplicationRecord
  belongs_to :restaurant_order
  has_many :addons, dependent: :destroy
end
