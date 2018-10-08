class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.references :node, null: true, foreign_key: true
      t.references :campaign, null: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
