class AddUserRefToProductions < ActiveRecord::Migration
  def change
    add_reference :productions, :user, index: true, foreign_key: true
  end
end
