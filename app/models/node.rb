class Node < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :father, class_name: 'Node', foreign_key: 'father_id', optional: true
  has_many :children, class_name: 'Node'
  has_many :node_user
  has_many :users, through: :node_user
end
