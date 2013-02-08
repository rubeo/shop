class Itemstable < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :price_per_line, :quantity
end
