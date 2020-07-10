class Manager < ApplicationRecord
  belongs_to :gc_branch
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, :format => { :with => /[([a-z]|[A-Z])0-9_-]{8,}/, message: "Password must be at least 8 characters" }
  validates :gc_branch_id, presence: true
end
