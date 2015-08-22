class Location < ActiveRecord::Base

  has_many :events

  mount_uploaders :images, ImageUploader

end
