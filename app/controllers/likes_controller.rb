class LikesController < ApplicationController
  def create
    @like = User.find(current_user.id).likes.new(likes_params)
    flash[:notice] = @like.errors.full_messages.to_sentence unless @like.save
    Like.update_likes_count(@like.post_id)
    redirect_back_or_to user_post_path(current_user.id, @like.post_id)
  end

  def destroy
    @like = User.find(current_user.id).likes.find(params[:id])
    post = @like.post
    @like.destroy
    Like.update_likes_count(@like.post_id)
    redirect_back_or_to user_post_path(current_user.id, post.id)
  end

  private

  def likes_params
    params.require(:like).permit(:post_id)
  end
end
