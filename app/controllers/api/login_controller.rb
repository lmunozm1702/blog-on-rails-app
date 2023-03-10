require 'jwt'

class Api::LoginController < Api::ApplicationController
  skip_before_action :authenticate_user

  @@hmac_secret = Rails.application.secrets.secret_key_base

  def index
    @auth_user = User.find_by_email(params[:email])
    if @auth_user && @auth_user.valid_password?(params[:password])
      payload = {
        id: @auth_user.id,
        name: @auth_user.name,
        email: @auth_user.email
      }
      token = JWT.encode(payload, @@hmac_secret, 'HS256')
      render json: { token: }
    else
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end
end
