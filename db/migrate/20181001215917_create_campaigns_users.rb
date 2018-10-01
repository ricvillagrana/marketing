class CreateCampaignsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns_users do |t|
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
