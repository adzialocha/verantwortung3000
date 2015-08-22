class AddImageToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :images, :json
  end
end
