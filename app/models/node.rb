class Node < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :father, class_name: 'Node', foreign_key: 'node_id', optional: true
  has_many :children, class_name: 'Node'
  has_many :publications
  has_many :node_user
  has_many :users, through: :node_user

  def community_manager
    if father.nil?
      campaign.community_manager
    else
      father.community_manager
    end
  end
end
