class Cart < ApplicationRecord
	# relationships .............................................................
	belongs_to :user
	has_many :line_items
end
