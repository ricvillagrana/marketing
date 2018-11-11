class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :role, null: true
      t.references :company, null: true
      t.integer :works_on_id, null: true

      t.string :username, null: true
      t.string :name, null: true
      t.string :lastname, null: true
      t.date :born_date, null: true
      t.boolean :deleted, default: false

      t.text :facebook_data

      # Facebook data
      t.string :facebook_access_token, null: true

      t.timestamps
    end
    add_index :users, %i[username], unique: true
  end
end
