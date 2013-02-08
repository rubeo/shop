class Order < ActiveRecord::Base
  belongs_to :user
  has_many :itemstables
  has_many :items, :through => :itemstables
  attr_accessible :credit_card_number, :credit_card_type, :cvv2, :date_of_ordering, :delivery_date, :expiry_date, :issue_number, :max_discount, :order_number, :pref_delivery_date, :role, :start_date, :status, :total_num_of_items, :total_price
end
