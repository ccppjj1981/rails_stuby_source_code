class Api::LineItemsController < ApplicationController
	def destroy
        Rails.logger.info("params====#{params.inspect}===#{params[:id]}")
        @line_item = LineItem.find(params[:id])
        @cart =  @line_item.cart
        @cart.total = @line_item.cart.total - (Product.find(@line_item.product_id).price * @line_item.quantity)
        @cart.save
        @line_item.destroy
        respond_to do |format|
	      format.js
	    end
    end
end
