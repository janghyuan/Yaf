class AddParentSloganToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :parent_slogan, :string
  end
end
