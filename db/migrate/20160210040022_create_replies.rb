class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :member_id
      t.integer :topic_id
      t.text :body

      t.timestamps null: false
    end
  end
end
