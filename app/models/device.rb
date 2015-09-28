class Device < ActiveRecord::Base

  include Imageable
  include Trackable
  include Sluggable

  has_many :requirements
  has_many :events, through: :requirements

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true

  before_destroy :prepare_black_board_posts

  def prepare_black_board_posts

    for requirement in self.requirements
      UserMailer.inform_about_rejected_requirement(requirement.event.production.user, requirement).deliver_now
    end

    self.requirements.update_all :device_id => nil, :title => self.title, :description => self.description

  end

end
