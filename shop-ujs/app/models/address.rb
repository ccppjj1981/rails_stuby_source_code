 class Address < ApplicationRecord
  belongs_to :user,inverse_of: :address
  #user_hash = { name:"fdffds",email: "test@123.com", password: "123456", password_confirmation: "123456", 
  	  #address_attributes: {address: 'fdsfds'}}

  #u = User.create(user_hash)
end
