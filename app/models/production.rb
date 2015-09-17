class Production < ActiveRecord::Base

  include Imageable

  has_many :events, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

end
