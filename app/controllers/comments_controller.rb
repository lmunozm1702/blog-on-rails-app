class CommentsController < ApplicationController
  def new
    @user = User.find(current_user)
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(current_user)
    @post = Post.find(params[:post_id])

    @comment.author_id = @user.id
    @comment.post_id = @post.id

    respond_to do |format|
      if @comment.save
        # Post.update_user_count(@user.id)
        format.html { redirect_to user_post_url(@user, @post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
