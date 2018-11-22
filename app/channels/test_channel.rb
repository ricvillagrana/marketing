class TestChannel < ApplicationCable::Channel
  def subscribed
    stream_from "test"
    stream_from "test:#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
