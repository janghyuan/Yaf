class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :member_id
      t.integer :topic_id
      t.integer :reply_id
      t.integer :sender_id
      t.boolean :unread

      t.timestamps null: false
    end
  end
end
