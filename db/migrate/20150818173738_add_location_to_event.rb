class AddLocationToEvent < ActiveRecord::Migration
  def change

    add_reference :events, :location, index: true, foreign_key: true

  end
end
