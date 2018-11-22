class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.references :company, foreign_key: true
      t.references :community_manager

      t.string :name
      t.text :objetive
      t.date :init_date
      t.date :finish_date

      t.boolean :finished, default: false
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
