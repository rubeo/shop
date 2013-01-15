class Role < ActiveRecord::Base
  attr_accessible :administrator, :customer, :merchandiser, :supervisor
  belongs_to :user
end
