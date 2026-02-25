class CreateVendors < ActiveRecord::Migration[8.1]
  def change
    create_table :vendors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :balance
      t.integer :status

      t.timestamps
    end
  end
end
