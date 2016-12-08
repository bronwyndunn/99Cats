class SessionsController < ApplicationController

  # log in page
  def new
  end

  # log in
  def create
    username, password = session_params.values
    @user = User.find_by_credentials(username, password)
    if @user
      login(@user)
      flash[:messages] = ["yah done lagged yerself in!"]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["invalid credentials"]
      render :new
    end

  end

  #log out
  def destroy
    logout
    flash[:messages] = ["goodbye! forever... :("]
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

end
