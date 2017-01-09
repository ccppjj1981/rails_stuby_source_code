class UsersController < ApplicationController
	before_action :set_user, only: [:show]
  
	def show
		puts "show"
	end

  def new
     #puts self.object_id
     @user = User.new
  end
  def create
    #puts self.object_id
    @user = User.new(user_params)
    if @user.save
      redirect_to products_url,notice:"注册成功"
    else
      render 'new'
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:password,:password_confirmation)
    end
end
