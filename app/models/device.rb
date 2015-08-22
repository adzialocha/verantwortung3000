class Device < ActiveRecord::Base

  has_many :requirements, dependent: :nullify
  has_many :events, through: :requirements

  belongs_to :user

  mount_uploaders :images, ImageUploader

end
