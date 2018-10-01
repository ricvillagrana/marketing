class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.references :company, foreign_key: true
      t.references :community_manager

      t.string :name
      t.text :objective
      t.date :init_date
      t.date :finish_date
      t.text :image

      t.boolean :finished
      t.boolean :deleted

      t.timestamps
    end
  end
end
