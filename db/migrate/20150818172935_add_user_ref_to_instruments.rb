class AddUserRefToInstruments < ActiveRecord::Migration
  def change
    add_reference :instruments, :user, index: true, foreign_key: true
  end
end
