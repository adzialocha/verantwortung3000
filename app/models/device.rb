class Device < ActiveRecord::Base

  include Imageable

  has_many :requirements, dependent: :nullify
  has_many :events, through: :requirements

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

end
