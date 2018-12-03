class RemoveTaskFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :task, foreign_key: true
  end
end
