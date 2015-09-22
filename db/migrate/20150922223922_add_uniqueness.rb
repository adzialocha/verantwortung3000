class AddUniqueness < ActiveRecord::Migration
  def change
    add_index :requirements, [ :event_id, :device_id ], :unique => true
    add_index :collaborations, [ :event_id, :instrument_id ], :unique => true
  end
end
