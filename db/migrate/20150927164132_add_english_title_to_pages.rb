class AddEnglishTitleToPages < ActiveRecord::Migration
  def change
    rename_column :pages, :title, :title_de
    add_column :pages, :title_en, :string
  end
end
