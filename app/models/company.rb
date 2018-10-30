class Company < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id', optional: true
  has_many :campaigns
  has_many :channels
  has_and_belongs_to_many :users
end
