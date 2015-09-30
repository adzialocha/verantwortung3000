class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :locations, :description_en, :text
  end
end
