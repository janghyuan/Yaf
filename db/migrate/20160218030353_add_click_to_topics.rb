class AddClickToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :click, :integer
  end
end
