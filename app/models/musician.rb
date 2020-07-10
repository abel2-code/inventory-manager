class Musician < ApplicationRecord
    has_many :product_exchanges
    has_many :products, through: :product_exchanges

    validates :name, presence: true
    validates :bank_account, presence: true, numericality: { greater_than: 0 }
end
