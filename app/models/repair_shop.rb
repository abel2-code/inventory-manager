class RepairShop < ApplicationRecord
    has_many :repair_requests
    has_many :products, through: :repair_requests

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :city, presence: true
    validates :capacity, presence: true
end
