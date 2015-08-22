class Location < ActiveRecord::Base

  include Imageable

  has_many :events

end
