class CreateDiscounts < ActiveRecord::Migration[8.1]
  def change
    create_table :discounts do |t|
      t.string :code
      t.integer :percentage
      t.boolean :active

      t.timestamps
    end
  end
end
