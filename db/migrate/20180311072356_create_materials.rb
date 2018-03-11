class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :material_name
      t.integer :material_quantity
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
