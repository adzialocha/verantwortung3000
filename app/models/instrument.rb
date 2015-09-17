class Instrument < ActiveRecord::Base

  include Imageable

  has_many :collaborations, dependent: :nullify
  has_many :events, through: :collaborations

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

end
