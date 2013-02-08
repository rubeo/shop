class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.decimal :total_price
      t.integer :total_num_of_items
      t.decimal :max_discount
      t.date :delivery_date
      t.string :status
      t.references :user
      t.string :role
      t.date :date_of_ordering
      t.date :pref_delivery_date
      t.string :credit_card_type
      t.string :credit_card_number
      t.string :cvv2
      t.date :expiry_date
      t.date :start_date
      t.string :issue_number
      t.references :itemstable

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :itemstable_id
  end
end
