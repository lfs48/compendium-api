json.messages do
    json.array! @messages do |message|
        json.partial! "messages/message", message: message
    end
end