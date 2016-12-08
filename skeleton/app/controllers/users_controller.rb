class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      redirect_to user_url(@user)
    else
      redirect_to cats_url

    end
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
