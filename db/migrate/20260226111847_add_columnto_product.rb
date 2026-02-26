class AddColumntoProduct < ActiveRecord::Migration[8.1]
  def change
    add_column :products,:mininventory,:integer,default: 10
  end
end
