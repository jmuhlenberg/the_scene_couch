class PostsController < ApplicationController
  before_action :redirect_unless_logged_in, except: [:show, :index]

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

  def show

  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(user_params)

    if @post.save
      redirect_to @post
    else
      redirect_to new_user_post_path
    end
  end 


  private

  def redirect_unless_logged_in
      @current_user = current_user

      redirect_to new_session_path unless @current_user
  end
end
