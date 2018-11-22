class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  serialize :facebook_data

  belongs_to :role, optional: true
  belongs_to :company, optional: true
  belongs_to :works_on, class_name: 'Company', optional: true

  has_one :user_creation

  has_and_belongs_to_many :campaigns
  has_many :campaigns_admin, class_name: 'Campaign', foreign_key: 'community_manager_id'

  has_many :node_user
  has_many :nodes, through: :node_user

  has_many :tasks
  has_many :tasks_created, class_name: 'Task', foreign_key: 'creator_id'

  has_many :notifications, class_name: 'Notification', foreign_key: 'reciever_id'
  has_many :notifications_sended, class_name: 'Notification', foreign_key: 'sender_id'

  def fullname
    "#{name} #{lastname}"
  end

  def pending?
    user_creation != nil
  end

end
