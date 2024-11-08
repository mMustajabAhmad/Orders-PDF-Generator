class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_one :delivery, dependent: :destroy
  has_one :payment, dependent: :destroy
  
  validates :order_number, :order_date, :first_name, :last_name, presence: true
end