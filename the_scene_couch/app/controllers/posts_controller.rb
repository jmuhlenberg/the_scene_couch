class PostsController < ApplicationController
  before_action :redirect_unless_logged_in, except: [:show, :index]
  # before_action :set_user, only: [:new, :edit, :show, :update]
  # before_action :set_user
  helper_method :current_user
  before_action :set_current_user
  before_action :current_user

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order("created_at DESC")

    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end


  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    # @post = Post.find(params[:id])
  end


  private

  def redirect_unless_logged_in
      @current_user = current_user

      redirect_to new_session_path unless @current_user
  end

  def post_params
    params.require(:post).permit(:title, :video, :content)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @current_user = current_user
  end
end
