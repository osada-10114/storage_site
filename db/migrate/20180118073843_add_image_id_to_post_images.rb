class AddImageIdToPostImages < ActiveRecord::Migration[5.1]
  def change
    add_column :post_images, :image_id, :string
  end
end
