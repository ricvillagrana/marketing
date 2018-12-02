class PublicationChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "publication_chat"
    stream_from "publication_chat:#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
