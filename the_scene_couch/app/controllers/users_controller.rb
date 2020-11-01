class UsersController < ApplicationController
  #defining middleware here to run before the action
  #before any action takes place, :{do this action}, [{which methods}]
  # before_action :set_user, only: [:edit, :show, :update]
  # same as: before_action :grab_user, except: [:index, :new, :create, :destroy]
  # before_action :set_user
  before_action :set_current_user
  before_action :current_user

  # index page action
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json {render json: @users}
    end
  end

  # show page action
  def show

  end

  # new user action
  def new
    @user = User.new()
  end

  # create user method
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, :notice => "Successfully signed up!"
    else
      redirect_to new_user_path
    end
  end


  private

  def user_params
    # cleans up the params when we need them
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    # instance variable = method made in application_controller.rb
    @current_user = current_user
  end
end
