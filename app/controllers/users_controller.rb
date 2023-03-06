class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    session[:current_user] = params[:id]
    @user = User.find(params[:id])
    @posts = User.last_three_posts(params[:id])
  end
end
