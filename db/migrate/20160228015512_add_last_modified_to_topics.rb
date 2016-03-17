class AddLastModifiedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :last_modified, :datetime
  end
end
