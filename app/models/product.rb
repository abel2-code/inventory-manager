class Product < ApplicationRecord
    belongs_to :gc_branch
    has_many :product_exchanges
    has_many :musicians, through: :product_exchanges
    has_many :repair_requests
    has_many :repair_shops, through: :repair_requests

    validates :product_type, presence: true
    validates :brand, presence: true
    validates :serial, presence: true, uniqueness: true, numericality: { greater_than: 10000000, less_than: 100000000, only_integer: true }
    validates :purchase_cost, presence: true, numericality: { only_integer: true }
    validates :rate_for_rental, numericality: { only_integer: true }
    validates :gc_branch_id, presence: true

    def combined_info
        "#{self.brand} #{self.product_type} - #{self.serial}"
    end

    def exchange_info
        "#{self.brand} #{self.product_type} - $#{self.purchase_cost}"
    end

end
