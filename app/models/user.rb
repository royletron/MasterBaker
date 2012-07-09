require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :username, :admin, :superadmin, :god, :password, :password_confirmation, :avatar
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] }
  
  email_regex = /\A[\w+\-.]+@oup.com+\z/i
  
  validates :name, :presence => true
  validates :username, :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true,
            :format => { :with => email_regex , :message => "@oup.com only!" },
            :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
            :confirmation => true,
            :length => { :within => 6..40 }
            
  before_save :encrypt_password
  
  def has_password?(submitted_password) 
    encrypted_password == encrypt(submitted_password)
  end
  
  def authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password(submitted_password)
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
