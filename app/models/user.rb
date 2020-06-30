class User < ActiveRecord::Base

  has_secure_password
  
  def self.authenticate_with_credentials(email, password)
    formatted_email = email.strip.downcase
    user = User.find_by_email(formatted_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}

  validates :password, presence: true
  validates :password, length: { minimum: 3 }

  validates :password_confirmation, presence: true

  def self.strip_and_case(email)
    formatted_email = email.strip.downcase
  end

end
