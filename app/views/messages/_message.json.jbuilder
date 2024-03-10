json.extract! message, 
    :id, 
    :body,
    :kind
json.set! :user, message.user.username