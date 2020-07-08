class ProductExchange < ApplicationRecord
  belongs_to :musician
  belongs_to :product

  validates :musician_id, presence: true
  validates :product_id, presence: true
end
