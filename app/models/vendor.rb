class Vendor < ApplicationRecord
  enum :status, { active: 0, suspended: 1 }

  # Associations
  belongs_to :user
  has_many   :products, dependent: :destroy
end