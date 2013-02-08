class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_description
      t.decimal :price
      t.string :dimension

      t.timestamps
    end
  end
end
