class AddUserRefToDevices < ActiveRecord::Migration
  def change
    add_reference :devices, :user, index: true, foreign_key: true
  end
end
