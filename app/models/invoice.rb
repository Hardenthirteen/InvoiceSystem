class Invoice < ApplicationRecord
  validates :invoiceTitle, presence: true
end
