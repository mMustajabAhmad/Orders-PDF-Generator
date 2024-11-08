class Delivery < ApplicationRecord
  belongs_to :order
  
  validates :delivery_date, :delivery_time, :delivery_address, presence: true
end