class TicketsController < ApplicationController
    before_action :current_user
    before_action :logged_in_user
	def index
	  @tickets = Ticket.includes(:user).limit(10)
	  #@tickets = Ticket.all
	end
end
