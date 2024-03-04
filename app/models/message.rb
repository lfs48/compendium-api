class Message < ApplicationRecord

    validates :body, 
    :kind,
    :chat_id,
    :user_id,
    presence: true

    validates :kind, inclusion: { in: %w(text roll), message: "invalid kind"}

    belongs_to :chat
    belongs_to :user

end