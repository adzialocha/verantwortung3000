class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :from
      t.datetime :to

      t.timestamps null: false
    end
  end
end
