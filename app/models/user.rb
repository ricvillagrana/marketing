class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :companies
  has_many :companies_user, class_name: 'CompaniesUsers'

  has_one :user_creation

  has_and_belongs_to_many :campaigns
  has_many :campaigns_admin, class_name: 'Campaign', foreign_key: 'community_manager_id'
  belongs_to :works_on, class_name: 'Company', foreign_key: 'company_id', optional: true

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

  def roles
    if companies.nil?
      companies_user.map(&:roles).reduce([]) { |f, s| f + s }
    elsif username == 'admin'
      [Role.where(keyword: 'superadmin').first]
    else
      []
    end
  end

end
