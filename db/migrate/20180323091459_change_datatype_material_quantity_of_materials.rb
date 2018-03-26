class ChangeDatatypeMaterialQuantityOfMaterials < ActiveRecord::Migration[5.1]
  def change
  	change_column :materials, :material_quantity, :string
  end
end
