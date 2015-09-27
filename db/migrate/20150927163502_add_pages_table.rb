class AddPagesTable < ActiveRecord::Migration
  def change
    create_table :pages do |t|

      t.string :title
      t.string :key

      t.text :content_de
      t.text :content_en

      t.json :images

      t.timestamps null: false

    end
  end
end
