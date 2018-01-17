class AddNicknameToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :nickname, :string
  end
end
