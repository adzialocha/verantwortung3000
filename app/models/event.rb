class Event < ActiveRecord::Base

  belongs_to :production
  has_one :location
  has_many :event_categories
  has_many :devices
  has_many :instruments

end
