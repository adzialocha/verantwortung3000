class Device < ActiveRecord::Base

  include Imageable
  include Trackable
  include Sluggable

  has_many :requirements, dependent: :nullify
  has_many :events, through: :requirements

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true

end
