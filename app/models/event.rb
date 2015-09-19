class Event < ActiveRecord::Base

  include PublicActivity::Model

  tracked :owner => Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }, :parameters => { :title => :production_title }

  belongs_to :production

  belongs_to :location

  has_and_belongs_to_many :event_categories, :join_table => :event_categories_events, dependent: :destroy

  has_many :requirements, dependent: :destroy
  has_many :devices, through: :requirements

  has_many :collaborations, dependent: :destroy
  has_many :instruments, through: :collaborations

  accepts_nested_attributes_for :collaborations, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true

  default_scope { order(:from) }

  validate :daterange_is_correct

  validates :location_id, :from, :to, presence: true

  validates_associated :collaborations
  validates_associated :requirements

  FESTIVAL_START = Time.new(2016, 8, 30)
  FESTIVAL_END = Time.new(2016, 9, 5)

  def group_by_day
    from.to_date
  end

  # attributes

  def production_title
    return self.title? ? self.title : self.production.title
  end

  def production_description
    return self.description? ? self.description : self.production.description
  end

  private

  def daterange_is_correct

    if self.from >= self.to
      errors.add(:to, I18n.t("productions.event.form.error_wrong_daterange"))
    end

    unless self.to.between? FESTIVAL_START, FESTIVAL_END
      errors.add(:to, I18n.t("productions.event.form.error_out_of_daterange"))
    end

    unless self.from.between? FESTIVAL_START, FESTIVAL_END
      errors.add(:from, I18n.t("productions.event.form.error_out_of_daterange"))
    end

  end

end
