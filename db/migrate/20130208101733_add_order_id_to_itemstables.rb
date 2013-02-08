class AddOrderIdToItemstables < ActiveRecord::Migration
  def change
    add_column :itemstables, :order_id, :integer 
  end
end
