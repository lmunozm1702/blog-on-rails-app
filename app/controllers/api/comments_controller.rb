require 'jwt'

class Api::CommentsController < Api::ApplicationController
  load_and_authorize_resource

  before_action :find_post, only: %i[index create]

  def index
    if @post && @post.comments.any?
      render json: { status: 'ok', data: @post.comments }
    else
      render json: { status: 'error', message: 'No comments' }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = @post.author_id
    @comment.post_id = @post.id

    if @comment.save
      render json: { status: :created, data: @comment }
    else
      render json: { error: @comment.errors, status: :unprocessable_entity }
    end
  end

  private

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
