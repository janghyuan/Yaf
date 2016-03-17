class AddHobbyToMembers < ActiveRecord::Migration
  def change
    add_column :members, :hobby, :string
  end
end
