class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates:email,presence: true,length:{maximum:255},
                        format:     { with: VALID_EMAIL_REGEX }
  has_many :products
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_secure_password
end
