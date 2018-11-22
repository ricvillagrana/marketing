class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.references :publication_status, foreign_key: true
      t.references :node, foreign_key: true

      t.text :name, null: true
      t.text :content, null: true
      t.date :publication_date, null: true
      t.boolean :published, default: false

      # Facebook data
      t.string :fb_id, null: true
      t.integer :likes, default: 0
      t.integer :shares, default: 0

      t.timestamps
    end
  end
end
