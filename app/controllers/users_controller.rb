class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    #render text: params
    allowed_params = params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
    @user = User.new allowed_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User created successully!"
    else
      render :new
    end
  end
end
