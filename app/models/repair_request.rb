class RepairRequest < ApplicationRecord
  belongs_to :product
  belongs_to :repair_shop

  validates :repair_shop_id, presence: true
  validates :product_id, presence: true
end
