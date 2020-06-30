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

  validates :first_name, presence: true
  validates :last_name, presence:true

  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, format: { without: /\s/, message: "cannot contain whitespace"}

  validates :password, presence: true
  validates :password, length: { minimum: 3 }

  validates :password_confirmation, presence: true

end
