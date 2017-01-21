class Variant < ApplicationRecord
	belongs_to :product,
    optional: true
end
