class Instrument < ActiveRecord::Base

  include Imageable
  include Trackable
  include Sluggable

  has_many :collaborations
  has_many :events, through: :collaborations

  belongs_to :user

  default_scope { order('title') }

  scope :owned_by, -> (user) { where(user_id: user.id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :description, presence: true

  before_destroy :prepare_black_board_posts

  def prepare_black_board_posts

    for collaboration in self.collaborations
      UserMailer.inform_about_rejected_collaboration(collaboration.event.production.user, collaboration).deliver_now
    end

    self.collaborations.update_all :instrument_id => nil, :title => self.title, :description => self.description

  end

end
