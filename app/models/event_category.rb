class EventCategory < ActiveRecord::Base

  has_and_belongs_to_many :events, :join_table => :event_categories_events

end
