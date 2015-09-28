class AddI18nColumnsForLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :description, :description_de
    add_column :locations, :description_en, :text
  end
end
