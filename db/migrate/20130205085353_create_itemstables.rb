class CreateItemstables < ActiveRecord::Migration
  def change
    create_table :itemstables do |t|
      t.references :item
      t.integer :quantity
      t.decimal :price_per_line

      t.timestamps
    end
    add_index :itemstables, :item_id
  end
end
