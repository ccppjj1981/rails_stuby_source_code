class Api::LineItemsController < ApplicationController
	def destroy
        Rails.logger.info("params====#{params.inspect}===#{params[:format]}")
        LineItem.find(params[:format]).destroy
    end
end
