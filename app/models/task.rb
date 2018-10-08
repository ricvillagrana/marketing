class Task < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :notifications
end
