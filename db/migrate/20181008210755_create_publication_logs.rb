class CreatePublicationLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :publication_logs do |t|
      t.references :publication, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.text :image

      t.timestamps
    end
  end
end
