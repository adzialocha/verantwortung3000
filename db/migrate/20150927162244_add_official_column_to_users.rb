class AddOfficialColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :official, :boolean
  end
end
