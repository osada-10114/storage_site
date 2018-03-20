class ChangeDatatypeExplanationOfPosts < ActiveRecord::Migration[5.1]
  def change
  	change_column :posts, :explanation, :text
  end
end
