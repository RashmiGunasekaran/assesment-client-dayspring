class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.references :vendor, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.integer :inventory_count
      t.boolean :is_clearance
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
