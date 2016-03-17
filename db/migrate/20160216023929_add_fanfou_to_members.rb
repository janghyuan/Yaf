class AddFanfouToMembers < ActiveRecord::Migration
  def change
    add_column :members, :fanfou, :string
  end
end
