class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates:email,presence: true,length:{maximum:255},
                        format:     { with: VALID_EMAIL_REGEX }
  ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED = 3
  has_secure_password
end
