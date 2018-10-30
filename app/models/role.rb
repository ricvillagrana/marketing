class Role < ApplicationRecord
  has_and_belongs_to_many :companies_user, class_name: 'CompaniesUsers'

  def users
    companies_user.map(&:users).reduce([]) { |f, s| f + s }
  end
end
