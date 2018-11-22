class UserCreation < ApplicationRecord
  belongs_to :user

  def generate_token(length = 25)
    self.creation_token = SecureRandom.hex(length)
  end
end
