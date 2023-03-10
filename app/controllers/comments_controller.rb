class CommentsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])

    @comment.author_id = @user.id
    @comment.post_id = @post.id

    respond_to do |format|
      if @comment.save
        Comment.update_comments_count(@post.id)
        format.html { redirect_to user_post_url(@user, @post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    Comment.update_comments_count(@comment.post_id)
    redirect_back_or_to user_post_path(current_user.id, @comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
