class AddImageToInstruments < ActiveRecord::Migration
  def change
    add_column :instruments, :images, :json
  end
end
