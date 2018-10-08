class Publication < ApplicationRecord
  belongs_to :status, class_name: 'PublicationStatus', foreign_key: 'publication_status_id'
  belongs_to :node
end
