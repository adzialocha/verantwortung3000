class AddEventCategoriesReferences < ActiveRecord::Migration
  def change

    create_table :event_categories_events do |t|

      t.belongs_to :event_categories, index: true
      t.belongs_to :event, index: true

    end

  end
end
