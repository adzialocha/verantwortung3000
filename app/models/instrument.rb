class Instrument < ActiveRecord::Base

  include Imageable
  include PublicActivity::Model

  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  has_many :collaborations, dependent: :nullify
  has_many :events, through: :collaborations

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

end
