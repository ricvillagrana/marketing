class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def register
  end

  def test_ac
    message = { message: 'Hola c:' }
    ActionCable.server.broadcast('test', message)
    TestChannel.broadcast_to(
      current_user.id,
      title: 'New things!',
      body: 'All the news fit to print'
    )
    render json: message
  end

end
