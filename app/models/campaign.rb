class Campaign < ApplicationRecord
  belongs_to :community_manager, class_name: 'User', foreign_key: 'community_manager_id'
  belongs_to :company
  has_and_belongs_to_many :users
  has_one :semantic_network, class_name: 'Node'
end
