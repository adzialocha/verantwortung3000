class AddUserAdminFlag < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean
  end

  def down
    remove_columns :users, :admin
  end
end
