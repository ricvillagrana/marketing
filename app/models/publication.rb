class Publication < ApplicationRecord
  belongs_to :status, class_name: 'PublicationStatus', foreign_key: 'publication_status_id'
  belongs_to :node
  has_many :log, class_name: 'PublicationLog'
  has_many :tasks
end
