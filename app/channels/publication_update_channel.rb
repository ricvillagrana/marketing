class PublicationUpdateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "publication_update"
    stream_from "publication_update:#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
