class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.timestamps null: false
      t.string   "src"
      t.integer  "imageable_id"
      t.string   "imageable_type"

    end
  end
end
