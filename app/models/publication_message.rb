class PublicationMessage < ApplicationRecord
  belongs_to :user
  belongs_to :publication
end
