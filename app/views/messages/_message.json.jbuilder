json.extract! message, 
    :id, 
    :body,
    :kind,
    :created_at
json.set! :user, message.user.username