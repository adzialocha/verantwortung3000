class AddSlugToInstrument < ActiveRecord::Migration
  def change
    add_column :instruments, :slug, :string
    add_index :instruments, :slug, unique: true
  end
end
