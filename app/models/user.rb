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

  before_save :encrypt_password

   def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
