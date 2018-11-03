class Company < ApplicationRecord
  has_one :admin, class_name: 'User'
  has_many :campaigns
  has_many :channels
  has_many :users, class_name: 'User', foreign_key: 'works_on_id'
  has_many :companies_user, class_name: 'CompaniesUsers'
end
