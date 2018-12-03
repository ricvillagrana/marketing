class Conversation < ApplicationRecord
  has_many :conversation_users
  has_many :users, through: :conversation_users

  has_many :messages, class_name: 'ConversationMessage', foreign_key: 'conversation_id'
end
