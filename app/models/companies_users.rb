class CompaniesUsers < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_and_belongs_to_many :roles
end
