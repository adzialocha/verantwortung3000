class AddSlugToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :slug, :string
    add_index :productions, :slug, unique: true
  end
end
