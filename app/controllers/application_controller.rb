class ApplicationController < ActionController::API

  def jwt_secret
    ENV["JWT_SECRET"]
  end

  private
  def token(user_id)
    payload = { user_id: user_id }
    token = JWT.encode(payload, jwt_secret, 'HS256')
    return token
  end

  def client_has_valid_token?
    !!current_user_id
  end

  def current_user_id
    begin
      token = request.headers["Authorization"]
      decoded_array = JWT.decode( token, jwt_secret, true, { algorithm: 'HS256' } )
      payload = decoded_array.first
      return payload["user_id"]
    rescue #JWT::VerificationError
      return nil
    end
  end

  def require_auth
    render json: {error: 'Unauthorized'}, status: :unauthorized unless client_has_valid_token?
  end

end
