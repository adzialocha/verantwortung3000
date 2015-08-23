class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :tel, :string
    add_column :users, :street, :string
    add_column :users, :city_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
