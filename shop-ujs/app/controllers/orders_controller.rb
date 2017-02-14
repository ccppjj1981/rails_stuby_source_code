class OrdersController < ApplicationController
	before_action :logged_in_user
	def create
		@cart = Cart.find(params[:cart_id])
		@order = current_user.orders.build(:total=>0)
		quantity = 0
		@cart.line_items.each do |line_item|
			if params["#{line_item.id}"].to_i == 1
				@order.order_items.build(:product_id=>line_item.product_id,:quantity=>line_item.quantity)
				@order.total += Product.find(line_item.product_id).price * line_item.quantity
				quantity += line_item.quantity
				line_item.destroy
			end
		end
		@order.quantity = quantity
		@order.save
		@cart.total = @cart.total - @order.total
		@cart.save
		@orders = current_user.orders.paginate(:page => params[:page],:per_page => 2)
	end

	def index
		@orders = current_user.orders.paginate(:page => params[:page],:per_page => 2)
	end
	def show
		@orders = current_user.orders.paginate(:page => params[:page],:per_page => 2)
    end
end
