class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def register
  end

  def publication_messages
    @messages = Publication.find(params[:publication_id]).messages
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

  def test_ac
    message = { message: 'Hola c:' }
    # ActionCable.server.broadcast('test', message)
    # TestChannel.broadcast_to(
    #   current_user.id,
    #   title: 'New things!',
    #   body: 'All the news fit to print'
    # )
    PublicationChatChannel.broadcast_to(
      Publication.first.id,
      message: {
        user: {
          id: 1,
          name: 'Joel'
        },
        message: "Cómo estás?
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        time: DateTime.now
      }
    )
    render json: message
  end

end
