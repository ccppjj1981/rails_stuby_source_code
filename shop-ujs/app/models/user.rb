class User < ApplicationRecord
  # extends ...................................................................
  has_secure_password
  # includes ..................................................................
  # security ..................................................................
  # relationships .............................................................
  has_many :tickets
  has_many :products
  has_many :orders
  has_one  :cart
  has_one :address,
    dependent: :destroy
  accepts_nested_attributes_for :address
  # validations ...............................................................
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validates: email,
  #   format: { with: VALID_EMAIL_REGEX }

  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum:255 }
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  # class methods .............................................................

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................

end
