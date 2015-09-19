class Location < ActiveRecord::Base

  include Imageable
  include Sluggable

  has_many :events

  default_scope { order('title') }

end
