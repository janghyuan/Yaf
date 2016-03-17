class AddBioToMembers < ActiveRecord::Migration
  def change
    add_column :members, :bio, :string
  end
end
