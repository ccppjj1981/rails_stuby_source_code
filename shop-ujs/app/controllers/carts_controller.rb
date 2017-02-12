class CartsController < ApplicationController
	before_action :set_cart,only: [:show]
	before_action :logged_in_user
	def show
		current_user.cart.create if current_user.cart.nil?
		Rails.logger.info("====#{params.inspect}")
	end
	def create
		current_user.create_cart if current_user.cart.nil?
		@cart = current_user.cart
		item = @cart.line_items.create(product_id: params[:product_id], quantity: params[:quantity])
		@cart.total = @cart.total.to_i + item.total
		@cart.save
		Rails.logger.info("====#{params.inspect}")
	end
    def destroy
        Rails.logger.info("====#{params.inspect}")
    end
	private
	def set_cart
		@cart = current_user.cart
	end

end
