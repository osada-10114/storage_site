class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_name
      t.integer :total_price
      t.string :explanation
      t.integer :category, default: 0, null: false
      t.string :material
      t.integer :material_quantity
      t.text :tip
      t.text :reason

      t.timestamps
    end
  end
end
