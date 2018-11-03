class Company < ApplicationRecord
  has_one :admin, class_name: 'User'
  has_many :campaigns
  has_many :channels
  has_and_belongs_to_many :users
  has_many :companies_user, class_name: 'CompaniesUsers'
end
