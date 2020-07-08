class GcBranch < ApplicationRecord
    has_many :products
    has_many :product_exchanges, through: :products
    has_many :repair_requests, through: :products

    validates :city, presence: :true
    validates :company_bank_acct, presence: true, numericality: { greater_than_or_equal_to: 20000, only_integer: true }
end
