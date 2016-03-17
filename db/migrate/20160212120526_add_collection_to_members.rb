class AddCollectionToMembers < ActiveRecord::Migration
  def change
    add_column :members, :collection, :string
  end
end
