class RemoveItemstableIdFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :itemstable_id 
  end

  def down
    add_column :orders, :itemstable_id, :references
  end
end
