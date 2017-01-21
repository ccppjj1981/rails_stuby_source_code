 class Address < ApplicationRecord
  belongs_to :user,
    inverse_of: :address,
    optional: true
  # user_hash = { name: "test", email: "test@123.com", password: "123456", password_confirmation: "123456", address_attributes: { city: 'bj' }}
  # u = User.create(user_hash)
end
