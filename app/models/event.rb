class Event < ActiveRecord::Base

  include PublicActivity::Model

  tracked :owner => Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }, :parameters => { :title => :production_title }

  belongs_to :user

  belongs_to :production

  belongs_to :location

  has_and_belongs_to_many :event_categories, :join_table => :event_categories_events, dependent: :destroy

  has_many :requirements, dependent: :destroy, :inverse_of => :event
  has_many :devices, through: :requirements

  has_many :collaborations, dependent: :destroy, :inverse_of => :event
  has_many :instruments, through: :collaborations

  accepts_nested_attributes_for :collaborations, allow_destroy: true

  accepts_nested_attributes_for :requirements, allow_destroy: true

  default_scope { order(:from) }

  validate :daterange_is_correct
  validate :location_is_free

  validates :location_id, :from, :to, presence: true

  validates_associated :requirements
  validates_associated :collaborations

  def group_by_day
    from.to_date
  end

  # attributes

  def cover_image
    self.production.cover_image
  end

  def production_title
    return self.title? ? self.title : self.production.title
  end

  def production_description
    return self.description? ? self.description : self.production.description
  end

  private

  def location_is_free

    # dont ask for the event id when we dont have one (on create action)

    id = self.id == nil ? '' : 'id != :id AND '

    existing_events = Event.where(id + 'location_id = :location AND (("to" >= :to AND "from" <= :from) OR ("to" > :from AND "from" < :to))', id: self.id, location: self.location_id, to: self.to, from: self.from).first

    if existing_events
      errors.add(:location_id, I18n.t("productions.event.form.error_location_occupied"))
    end

  end

  def daterange_is_correct

    if self.from >= self.to
      errors.add(:to, I18n.t("productions.event.form.error_wrong_daterange"))
    end

    unless self.to.between? Rails.application.config.FESTIVAL_START, Rails.application.config.FESTIVAL_END
      errors.add(:to, I18n.t("productions.event.form.error_out_of_daterange"))
    end

    unless self.from.between? Rails.application.config.FESTIVAL_START, Rails.application.config.FESTIVAL_END
      errors.add(:from, I18n.t("productions.event.form.error_out_of_daterange"))
    end

  end

end
