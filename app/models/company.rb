class Company < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id', optional: true
  has_many :campaigns
  has_many :channels
end
