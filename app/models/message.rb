class Message < ApplicationRecord

    after_create_commit { broadcast_message }

    paginates_per 25

    validates :body, 
    :kind,
    :user_id,
    presence: true

    validates :kind, inclusion: { in: %w(text roll), message: "invalid kind"}

    belongs_to :user

    private

    def broadcast_message
        ActionCable.server.broadcast('MessagesChannel', {
            id:,
            body:,
            created_at:,
            user: {
                username: user.username,
                id: user.id,
                color: user.color,
                gm: user.gm
            }
        })
    end

end