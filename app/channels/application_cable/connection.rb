module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = current_user_id
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def jwt_secret
      ENV["JWT_SECRET"]
    end

    private

    def decode_jwt
      begin
        token = request.headers["Authorization"].split(' ')[1]
        decoded_array = JWT.decode( token, jwt_secret, true, { algorithm: 'HS256' } )
        payload = decoded_array.first
        return payload
      rescue #JWT::VerificationError
        return nil
      end
    end

    def current_user_id
      decoded = decode_jwt
      return decoded['sub']
    end

    def client_has_valid_token?
      begin
        user = User.find(current_user_id)
        return !!user
      rescue
        return false
      end
    end

  end
end
