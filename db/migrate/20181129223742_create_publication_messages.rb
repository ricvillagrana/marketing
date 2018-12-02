class CreatePublicationMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :publication_messages do |t|
      t.references :user, foreign_key: true
      t.references :publication, foreign_key: true
      t.text :message
      t.boolean :seen
      t.boolean :edited

      t.timestamps
    end
  end
end
