class CreateNodeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :node_users do |t|
      t.references :user, foreign_key: true
      t.integer :granter_id, foreign_key: true
      t.references :role, foreign_key: true
      t.references :node, foreign_key: true

      t.timestamps
    end
  end
end
