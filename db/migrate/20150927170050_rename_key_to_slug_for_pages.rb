class RenameKeyToSlugForPages < ActiveRecord::Migration
  def change
    rename_column :pages, :key, :slug
  end
end
