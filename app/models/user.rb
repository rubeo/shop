class User < ActiveRecord::Base
  attr_accessible :login_name, :first_name, :lastName, :password, :confirmPassword, :email, :region, :role
end
