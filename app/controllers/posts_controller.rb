class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    # Post.find(author_id: params[:user_id])
    # @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
