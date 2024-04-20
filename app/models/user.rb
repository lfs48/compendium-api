class User < ApplicationRecord

    validates :username, :password_digest, presence: true
    validates :username, uniqueness: true, length: {minimum: 3}
    validates :password, allow_nil: true, length: {minimum: 8}
    validates :color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/, message: "must be a valid color hex code" }

    attr_reader :password

    has_many :messages

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