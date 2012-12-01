class User < ActiveRecord::Base
  attr_accessible :login_name, :first_name, :lastName, :password, :confirmPassword, :email
  has_many :roles, :dependent => :destroy
  has_many :regions, :dependent => :destroy
end
