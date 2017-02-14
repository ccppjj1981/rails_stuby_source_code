class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items,dependent: :destroy
	# validations ...............................................................
	validates :quantity,presence: true
end
