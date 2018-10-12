class CreateUserCreations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_creations do |t|
      t.references :user
      t.string :creation_token

      t.timestamps
    end
  end
end
