json.messages do
  json.array! @messages do |message|
    json.user message.user
    json.message message
  end
end
