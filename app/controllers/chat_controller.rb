class ChatController < ApplicationController
  before_action :authenticate_user!

  def users
    users = []
    users = users + current_user.company.users unless current_user.company.nil?
    users = users + current_user.works_on.users unless current_user.works_on.nil?
    respond_to do |format|
      format.html
      format.json { render json: { users: users.flatten }, include: %i[role] }
    end
  end

  def send_message
    conversation = Conversation.find(params[:conversation_id])
    message = conversation.messages.create(
      user_id: current_user.id,
      message: params[:message],
      seen: false
    )

    ConversationChannel.broadcast_to(
      conversation.id,
      message: message.to_json(include: [:user])
    )
  end

  def find_or_create_conversation
    conversation = conversation_with(params[:user_id])
    render json: { conversation: conversation, status: 200 }, include: [messages: { include: [:user] }]
  end

  def conversation_with(user_id)
    mate = User.find(user_id)
    conversation = mate.conversations.map { |c| c if c.users.include?(current_user) }
    conversation.delete(nil)
    if conversation.empty?
      conversation = Conversation.new(name: "#{current_user.name}-#{mate.name}")
      conversation.users.append(mate, current_user)
      conversation.save
    else
      conversation = conversation.pop
    end
    conversation
  end
end
