class Message < ApplicationRecord

    validates :body, 
    :kind,
    :user_id,
    presence: true

    validates :kind, inclusion: { in: %w(text roll), message: "invalid kind"}

    belongs_to :user

end