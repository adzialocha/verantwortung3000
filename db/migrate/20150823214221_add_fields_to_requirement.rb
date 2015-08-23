class AddFieldsToRequirement < ActiveRecord::Migration
  def change
    add_column :requirements, :title, :string
    add_column :requirements, :description, :text
  end
end
