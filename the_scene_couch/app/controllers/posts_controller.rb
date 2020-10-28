class PostsController < ApplicationController
  before_action :redirect_unless_logged_in, except: [:show, :index]


  private

  def redirect_unless_logged_in
      @current_user = current_user
      
      redirect_to new_session_path unless @current_user
  end
end
