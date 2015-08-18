class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|

      t.belongs_to :event, index: true
      t.belongs_to :device, index: true

      t.boolean :confirmed
      t.timestamps null: false

    end
  end
end
