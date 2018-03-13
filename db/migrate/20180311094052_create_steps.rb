class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :step_explanation
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
