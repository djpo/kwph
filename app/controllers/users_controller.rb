class UsersController < ApplicationController
  before_action :is_authenticated?
  def show
  	@user = User.find params[:id]
  end

  def new
  end

  def create
  	@user = User.create(user_params)

  		if @user.save
  			session[:user_id] = @user.id
        @user_language = @user.user_language.create(user_language_params)
  			# flash[:success] = "User created"
      		redirect_to root_path
      	else
      		# flash[:danger] = "Credentials invalid"
      		redirect_to "/signup"
      	end
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end

  def user_language_params
      params.require(:user).permit(:session_language)
  end
  
end