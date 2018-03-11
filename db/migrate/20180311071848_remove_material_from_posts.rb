class RemoveMaterialFromPosts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :material
  end
end
