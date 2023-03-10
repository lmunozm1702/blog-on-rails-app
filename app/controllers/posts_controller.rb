class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.includes(:user)
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(params[:user_id])

    @post.author_id = @user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      if @post.save
        Post.update_user_count(@user.id)
        format.html { redirect_to user_url(@user), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    Post.update_user_count(@post.author_id)
    redirect_back_or_to user_posts_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
