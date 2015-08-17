class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
