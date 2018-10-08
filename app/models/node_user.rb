class NodeUser < ApplicationRecord
  belongs_to :user
  belongs_to :granter, class_name: 'User', foreign_key: 'granter_id'
  belongs_to :role
  belongs_to :node
end
