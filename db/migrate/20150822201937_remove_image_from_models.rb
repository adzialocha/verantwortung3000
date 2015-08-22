class RemoveImageFromModels < ActiveRecord::Migration
  def change
    remove_column :productions, :images
    remove_column :instruments, :images
    remove_column :devices, :images
    remove_column :locations, :images
  end
end
