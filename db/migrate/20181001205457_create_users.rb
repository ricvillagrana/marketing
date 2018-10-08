class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name, null: true
      t.string :lastname, null: true
      t.text :image
      t.date :born_date
      t.boolean :deleted

      # Facebook data
      t.string :fb_id
      t.string :fb_name
      t.string :fb_image

      t.timestamps
    end
    add_index :users, %i[username], unique: true
  end
end
