class ApplicationController < ActionController::Base
  def current_user
    session[:current_user] || User.first
  end
end
