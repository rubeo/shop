class Region < ActiveRecord::Base
  attr_accessible :east, :north, :south, :west
  belongs_to :user
end
