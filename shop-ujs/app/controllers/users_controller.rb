class UsersController < ApplicationController
	before_action :set_user, only: [:show,:update]
  before_action :current_user
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
  def edit
    @user = User.find(params[:id])
  end
  def update

    #Rails.logger.info("user_params===#{user_params.inspect}")
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:password,:password_confirmation,
        address_attributes: [:id,:state, :city, :address, :address2, :zipcode, :receiver, :phone])
    end
end
