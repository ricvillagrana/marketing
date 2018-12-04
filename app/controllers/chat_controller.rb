class ChatController < ApplicationController
  before_action :authenticate_user!

  def users
    users = []
    users = users + current_user.company.users unless current_user.company.nil?
    users = users + current_user.works_on.users unless current_user.works_on.nil?
    users = users + [current_user.works_on.admin] unless current_user.works_on.nil?

    users = users + User.where(role: Role.where(keyword: 'superadmin').first) if current_user.role.keyword == 'admin'
    users = users + User.where(role: Role.where(keyword: 'admin').first) if current_user.role.keyword == 'superadmin'
    respond_to do |format|
      format.html
      format.json { render json: { users: users.flatten }, include: %i[role] }
    end
  end

  def unread_messages
    count = current_user.conversations.map { |c| c.messages.where(seen: false).size }.sum
    respond_to do |format|
      format.html
      format.json { render json: { count: count, status: 200 } }
    end
  end

  def user_conversations
    conversations = current_user.conversations
    respond_to do |format|
      format.html
      format.json { render json: { conversations: conversations, status: 200 }, include: [:users, messages: { include: [user: { only: [:name, :lastname, :id, :username] }] }] }
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
      message: message.to_json(include: [user: { except: %i[facebook_data facebook_access_token] }])
    )

    ConversationNotificationChannel.broadcast_to(
      mate.id,
      {
        title: "Mensaje de #{current_user.fullname}",
        message: params[:message],
        sender: current_user,
        reciever: mate,
        seen: false
      }
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

  def mate
    users = Conversation.find(params[:conversation_id]).users
    user = users.where.not(id: current_user.id)
    user.first
  end
end
