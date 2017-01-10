class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end
  def create
  	user = User.find_by(email: params[:session][:email]) 
  	if user && user.authenticate(params[:session][:password])
		# 登入用户,然后重定向到用户的资料页面
        log_in user
        #redirect_to user
        redirect_to root_url
	else
		flash[:danger] = 'Invalid email/password combination' # 不完全正确
		# 创建一个错误消息
		render 'new' 
	end
  end

  def destroy 
  	log_out
    redirect_to root_url
  end
end
