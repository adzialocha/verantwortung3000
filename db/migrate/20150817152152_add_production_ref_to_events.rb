class AddProductionRefToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :production, index: true, foreign_key: true
  end
end
