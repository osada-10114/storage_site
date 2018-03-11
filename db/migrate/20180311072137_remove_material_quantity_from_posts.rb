class RemoveMaterialQuantityFromPosts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :material_quantity
  end
end
