class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :keyword
      t.string :description, null: true
      t.timestamps
    end
    add_index :roles, :keyword, unique: true
  end
end
