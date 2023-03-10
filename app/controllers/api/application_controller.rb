class Api::ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to api_login_path, alert: exception.message
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  protected

  def authenticate_user
    header = request.headers['Authorization']
    header = header.to_s.split.last if header.present?
    decoded_token = JWT.decode header, Api::LoginController.hmac_secret, true, { algorithm: 'HS256' }
    payload = decoded_token[0]
    @auth_user = User.find_by_id(payload['id']) if payload && payload['id']
  rescue JWT::VerificationError
    render json: { message: 'Invalid token' }, status: 401
  end
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password])
end
