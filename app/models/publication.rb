class Publication < ApplicationRecord
  belongs_to :status, class_name: 'PublicationStatus', foreign_key: 'publication_status_id'
  belongs_to :node
  has_many :log, class_name: 'PublicationLog'
  has_many :tasks
  has_many :channels

  has_many_attached :images

  def campaign
    Campaign.find get_campaign_id(node)
  end

  def get_campaign_id(node)
    if node.father
      get_campaign_id(node.father)
    else
      node.campaign_id
    end
  end
end
