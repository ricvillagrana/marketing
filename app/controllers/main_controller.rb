class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def register
  end

  def publication_messages
    @messages = Publication.find(params[:publication_id]).messages.order(created_at: :asc)
  end

  def send_message
    publication = Publication.find(params[:publication_id])
    message = publication.messages.create(
      user_id: current_user.id,
      publication_id: publication.id,
      message: params[:message],
      seen: false
    )

    PublicationChatChannel.broadcast_to(
      publication.id,
      message: {
        user: current_user,
        message: message
      }
    )
  end

end
