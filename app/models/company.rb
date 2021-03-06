class Company < ApplicationRecord
  serialize :facebook_data
  has_one :admin, class_name: 'User'
  has_many :campaigns
  has_many :channels
  has_many :users, class_name: 'User', foreign_key: 'works_on_id'
  has_many :companies_user, class_name: 'CompaniesUsers'

  def workers
    workers = users.map { |u| u.role.keyword != 'admin' ? u : nil }
    workers.delete nil
    workers
  end
end
