class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.references :publication, foreign_key: true
      t.references :company, foreign_key: true
      t.string :name
      t.boolean :public

      t.timestamps
    end
  end
end
