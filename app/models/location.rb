class Location < ActiveRecord::Base

  include Imageable

  extend FriendlyId

  friendly_id :title, use: :slugged

  has_many :events

end
