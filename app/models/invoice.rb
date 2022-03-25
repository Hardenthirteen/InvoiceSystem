class Invoice < ApplicationRecord
  validates :invoiceTitle, presence: true
  has_many :tests
end
