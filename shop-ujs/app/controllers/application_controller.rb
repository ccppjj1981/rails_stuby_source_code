class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    attr_accessor :current_user
    def login(user)
    	session[:user_id] = user.id 
	    @current_user = user
    	Rails.logger.info("app ======#{current_user}")
    end
    def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	# 如果用户已登录,返回 true,否则返回 false 
	def logged_in?
		!current_user.nil? 
	end
	def log_out
        session.delete(:user_id)
		@current_user = nil 
    end
end
