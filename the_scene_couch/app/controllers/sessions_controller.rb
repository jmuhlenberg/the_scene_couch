class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:user][:username])

    # if the username matches, test the password
    if @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      redirect_to root_url
    else
      # examples of how to flash messages:
      # flash[:alert] = "Username or password was incorrect."
      # flash.alert = "Username or password was incorrect."
      redirect_to new_session_path, notice: "Username or password was incorrect."
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end
end
