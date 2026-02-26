class Vendor < ApplicationRecord
  enum :status, { active: 0, suspended: 1 }

  # Associations
  belongs_to :user
  has_many   :products, dependent: :destroy

  # Scope for vendors with more than 10 products
  scope :with_many_products, -> { joins(:products).group('vendors.id').having('COUNT(products.id) > 10') }

  # Scope for vendors with positive balance
  scope :with_positive_balance, -> { where('balance > 0') }

  # Scope for top-tier vendors
  scope :top_tier, -> { with_many_products.with_positive_balance }
end


