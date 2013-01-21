class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :login_name, :first_name, :lastName, :password, :confirmPassword, :email, :region, :role
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :login_name,  :presence   => true,
                          :uniqueness => true
  validates :first_name,  :presence   => true
  validates :lastName,    :presence   => true
  validates :email,       :presence   => true,
                          :format     => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
  validates :region,      :presence   => true
  validates :role,        :presence   => true
  validates :password,    :presence   => true,
                          :confirmation => true

end
