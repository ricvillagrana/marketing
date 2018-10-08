class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :channel, foreign_key: true
      t.text :message
      t.boolean :seen, default: false
      t.boolean :edited, default: false
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
