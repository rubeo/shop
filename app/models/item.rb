class Item < ActiveRecord::Base
  attr_accessible :dimension, :item_description, :item_name, :price
  belongs_to :itemstable
  has_many :orders, :through => :itemstables
end
