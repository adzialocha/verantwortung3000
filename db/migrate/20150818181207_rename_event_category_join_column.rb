class RenameEventCategoryJoinColumn < ActiveRecord::Migration
  def change
    rename_column :event_categories_events, :event_categories_id, :event_category_id
  end
end
