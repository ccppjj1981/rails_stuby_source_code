class LineItem < ApplicationRecord
	# relationships .............................................................
	belongs_to :cart
	# public instance methods ...................................................
	def total
		Product.find(self.product_id).price * quantity.to_i
	end
end
