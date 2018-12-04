class CreateConversationMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :conversation_messages do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true
      t.boolean :seen

      t.timestamps
    end
  end
end
