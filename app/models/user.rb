class User < ActiveRecord::Base
  has_secure_password
  # before_save { self.email.downcase! }

  validates :password, length: { minimum: 6 }, presence: true
  validates :password_confirmation, presence: true
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    normalizeEmail = email.strip.downcase
    user = User.find_by_email(normalizeEmail)
    if user && user.authenticate(password)
      user
    else
      nil      
    end  
  end
  
end
