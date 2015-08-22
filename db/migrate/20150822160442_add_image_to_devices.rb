class AddImageToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :images, :json
  end
end
