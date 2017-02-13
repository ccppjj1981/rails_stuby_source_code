class OrdersController < ApplicationController
	before_action :logged_in_user
	def create
		@cart = Cart.find(params[:cart_id])
		@order = current_user.orders.create
		begin
			quantity = 0
			@cart.line_items.each do |line_item|
				@order.order_items.create(:product_id=>line_item.product_id,:quantity=>line_item.quantity)
				quantity += line_item.quantity
				line_item.destroy
			end
			@order.total = @cart.total
			@order.quantity = quantity
			@order.save
			@cart.total = 0
			@cart.save
			@orders = current_user.orders
	    rescue
	    	@order.destroy
		end
		
	end
	
	def show
		@orders = current_user.orders.paginate(:page => params[:page],:per_page => 2)
    end
end
