class Node < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :father, class_name: 'Node', foreign_key: 'father_id', optional: true
  has_many :children, class_name: 'Node'
end
