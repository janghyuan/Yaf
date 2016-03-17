class AddMemberIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :member_id, :integer
  end
end
