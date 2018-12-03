class AddHotlinkToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :hotlink, :text
  end
end
