class Company < ApplicationRecord
  has_one :admin, class_name: 'User'
  has_many :campaigns
  has_many :channels
  has_many :users
end
