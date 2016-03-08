class AddFieldsToSignUp < ActiveRecord::Migration
  def change
    add_column :users, :tos_accepted, :boolean
    add_column :users, :camping_preferred, :boolean
  end
end
