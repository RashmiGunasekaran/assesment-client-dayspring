class AddDiscountReferenceToOrder < ActiveRecord::Migration[8.1]
  def change
    add_reference :orders, :discount, null: true, foreign_key: true
  end
end
