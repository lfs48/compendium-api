class User < ApplicationRecord

    validates :username, :password_digest, presence: true
    validates :username, uniqueness: true
    validates :password, allow_nil: true, length: {minimum: 8}

    attr_reader :password

    def self.authenticate(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def password=(password)
        @password = password
        digest = BCrypt::Password.create(password)
        self.password_digest = digest
    end

    def is_password?(password)
        digest = BCrypt::Password.new(self.password_digest)
        return digest.is_password?(password)
    end

end