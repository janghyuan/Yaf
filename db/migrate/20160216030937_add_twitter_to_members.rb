class AddTwitterToMembers < ActiveRecord::Migration
  def change
    add_column :members, :twitter, :string
  end
end
