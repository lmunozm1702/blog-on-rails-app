class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(1)
  end
end
