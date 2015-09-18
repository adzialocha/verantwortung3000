class Instrument < ActiveRecord::Base

  include Imageable
  include Trackable
  include Sluggable

  has_many :collaborations, dependent: :nullify
  has_many :events, through: :collaborations

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true

end
