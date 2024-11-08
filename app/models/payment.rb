class Payment < ApplicationRecord
  belongs_to :order
  
  validates :paid_by, :card_number, presence: true
end