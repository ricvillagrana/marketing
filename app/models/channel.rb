class Channel < ApplicationRecord
  belongs_to :publication, optional: true
  belongs_to :company
  has_many :messages
end
