class User < ActiveRecord::Base
  
  attr_accessible :login_name, :first_name, :lastName, :password, :confirmPassword, :email, :region, :role
  default_scope -> { order("id asc") }
  #paginates_per 3
  
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
