class User < ActiveRecord::Base
  attr_accessible :login_name, :first_name, :lastName, :password, :confirmPassword, :email
  has_one :role, :dependent => :destroy
  has_one :region, :dependent => :destroy
end
