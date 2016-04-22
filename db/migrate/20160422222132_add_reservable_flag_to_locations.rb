class AddReservableFlagToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :reservable, :boolean
  end
end
