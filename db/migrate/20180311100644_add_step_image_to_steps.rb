class AddStepImageToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :step_image_id, :string
  end
end
