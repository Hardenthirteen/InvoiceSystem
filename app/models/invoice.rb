class Invoice < ApplicationRecord
  validates :invoice_title, presence: true
  has_many :tests
end
