class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :publication, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :creator_id, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :deadeline

      t.timestamps
    end
  end
end
