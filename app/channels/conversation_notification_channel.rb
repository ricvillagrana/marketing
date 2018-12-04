class ConversationNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_notification:#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
