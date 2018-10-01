class Campaign < ApplicationRecord
  belongs_to :community_manager, class_name: 'User', foreign_key: 'community_manager_id'
  belongs_to :company
  has_and_belongs_to_many :users
end
