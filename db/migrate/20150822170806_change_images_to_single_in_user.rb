class ChangeImagesToSingleInUser < ActiveRecord::Migration
  def change
    rename_column :users, :images, :image
    change_column :users, :image, :string
  end
end
