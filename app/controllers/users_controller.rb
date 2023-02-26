class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(2)
  end
end
