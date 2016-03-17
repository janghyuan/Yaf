class AddWeiboToMembers < ActiveRecord::Migration
  def change
    add_column :members, :weibo, :string
  end
end
