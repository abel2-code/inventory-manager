class ProductExchange < ApplicationRecord
  belongs_to :musician
  belongs_to :product

  validates :musician_id, presence: true
  validates :product_id, presence: true, numericality: { greater_than: 0 }
  validates :total_number_scheduled, presence: true, numericality: { greater_than: 0 }
  validates :exchange_type, presence: true

  @@tax_rate = 1.0825
  @@student_discount = 0.9

  def process_product_exchange
    bill_musician
    add_to_branch_account
    toggle_availability
  end

  def bill_musician
    self.musician.bank_account -= calculate_total_bill
    self.musician.save
  end

  def add_to_branch_account
    self.product.gc_branch.company_bank_acct += calculate_total_bill
    self.product.gc_branch.save
  end

  def check_for_adequate_funds
    if self.product
      self.musician.bank_account >= self.product.purchase_cost
    end
  end

  def toggle_availability
    self.product.update(available?: !self.product.available?)
    self.product.save
  end

  def calculate_total_bill
    @cost = self.product.purchase_cost

    if self.musician.is_a_student?
      @cost = self.product.purchase_cost * @@student_discount
    end

    @cost * self.total_number_scheduled * @@tax_rate
  end

  def refund
    refund_musician
    subtract_from_branch
    toggle_availability
  end

  def refund_musician
    self.musician.bank_account += calculate_total_bill
    self.musician.save
  end 
  
  def subtract_from_branch
    self.product.gc_branch.company_bank_acct -= calculate_total_bill
    self.product.gc_branch.save
  end 

end
