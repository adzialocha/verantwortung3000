class AddFieldsToInstrument < ActiveRecord::Migration
  def change
    add_column :collaborations, :title, :string
    add_column :collaborations, :description, :text
  end
end
