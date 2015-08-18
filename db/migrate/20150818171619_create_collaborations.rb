class CreateCollaborations < ActiveRecord::Migration
  def change

    create_table :collaborations do |t|

      t.belongs_to :event, index: true
      t.belongs_to :instrument, index: true

      t.boolean :confirmed
      t.timestamps null: false

    end

  end
end
