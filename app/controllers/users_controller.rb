class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @user = User.find(2)
    @user = User.first
  end
end
