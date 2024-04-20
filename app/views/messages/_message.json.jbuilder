json.extract! message, 
    :id, 
    :body,
    :kind,
    :created_at
    
json.set! :user do
    json.partial! 'users/user', user: message.user
end