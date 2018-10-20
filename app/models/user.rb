class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles

  has_one :user_creation

  has_and_belongs_to_many :campaigns
  has_many :campaigns_admin, class_name: 'Campaign', foreign_key: 'community_manager_id'
  has_many :companies

  has_many :node_user
  has_many :nodes, through: :node_user

  has_many :tasks
  has_many :tasks_created, class_name: 'Task', foreign_key: 'creator_id'

  has_many :notifications, class_name: 'Notification', foreign_key: 'reciever_id'
  has_many :notifications_sended, class_name: 'Notification', foreign_key: 'sender_id'

  has_many :users
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id', optional: true

  def self.fullname
    "#{self.name} #{self.lastname}"
  end

  def self.pending?
    user_creation != nil
  end

end
