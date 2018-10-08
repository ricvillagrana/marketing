class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :task, foreign_key: true
      t.integer :reciever_id, foreign_key: true
      t.integer :sender_id, foreign_key: true

      t.text :message
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
