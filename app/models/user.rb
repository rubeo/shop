class User < ActiveRecord::Base
  has_many :orders
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, 
         :rememberable, 
         :trackable,
        #:validatable,
         :lockable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login_name, 
                  :first_name, 
                  :last_name, 
                  :password, 
                  :password_confirmation, 
                  :email, 
                  :region, 
                  :role,
                  :remember_me
  # Регулярное выражение для валидации email                
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :login_name,  :presence     => true,
                          :uniqueness   => true
  validates :first_name,  :presence     => true
  validates :last_name,   :presence     => true
  validates :email,       :presence     => true,
                          :format       => { :with => email_regex }
                          
  validates :region,      :presence     => true
  validates :role,        :presence     => true
  validates :password,    :presence     => true,
                          :confirmation => true,
                          :length       => {:within => 4..10},
                          :on           => :create
  validates :password,    :confirmation => true,
                          :length       => {:within => 4..10},
                          :allow_blank  => true,
                          :on           => :update

  default_scope -> { order("id asc") }
    
  scope :start_with, lambda { |fields, query| where(
      if fields.kind_of? Array 
        fields.map{|f| "#{f} LIKE '#{query}%'"}.join ' OR '
      else  
        "#{fields} LIKE '#{query}%'"
      end
    )
  }
  scope :equals, lambda { |fields, query| where(
      if fields.kind_of? Array 
        fields.map{|f| "#{f} = '#{query}'"}.join ' OR '
      else
        "#{fields} = '#{query}'"
      end
    )
  }
  scope :not_equal_to, lambda { |fields, query| where(
      if fields.kind_of? Array 
        fields.map{|f| "#{f} != '#{query}'"}.join ' OR '
      else
        "#{fields} != '#{query}'"
      end
    )
  }
  scope :contains, lambda { |fields, query| where(
      if fields.kind_of? Array 
        fields.map{|f| "#{f} LIKE '%#{query}%'"}.join ' OR '
      else
        "#{fields} LIKE '%#{query}%'"
      end
    )
  }
  scope :does_not_contain,  lambda { |fields, query| where(
      if fields.kind_of? Array 
        fields.map{|f| "#{f} NOT LIKE '%#{query}%'"}.join ' OR '
      else
        "#{fields} NOT LIKE '%#{query}%'"
      end
    )
  }

end
