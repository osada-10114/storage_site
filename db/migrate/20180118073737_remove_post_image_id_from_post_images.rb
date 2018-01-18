class RemovePostImageIdFromPostImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :post_images, :post_image_id, :string
  end
end
