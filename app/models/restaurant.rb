class Restaurant < ApplicationRecord
  has_many :restaurant_orders, dependent: :destroy
end
