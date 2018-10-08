class CreatePublicationStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :publication_statuses do |t|
      t.string :name
      t.string :description, null: true
      t.timestamps
    end
  end
end
