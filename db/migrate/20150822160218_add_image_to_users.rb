class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :images, :json
  end
end
