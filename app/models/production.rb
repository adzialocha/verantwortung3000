class Production < ActiveRecord::Base

  include Imageable
  include Trackable
  include Sluggable

  has_many :events, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :events, allow_destroy: true

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

end
