class Page < ActiveRecord::Base

  include Imageable

  extend FriendlyId
  friendly_id :key, :use => [:slugged, :finders]


end
