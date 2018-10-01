class User < ApplicationRecord
  has_and_belongs_to_many :roles

  default_scope { select(User.column_names - ["password_digest"]) }
  has_secure_password
end
