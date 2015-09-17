class Event < ActiveRecord::Base

  include PublicActivity::Model

  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  belongs_to :production

  belongs_to :location

  has_and_belongs_to_many :event_categories, :join_table => :event_categories_events, dependent: :destroy

  has_many :requirements, dependent: :destroy
  has_many :devices, through: :requirements

  has_many :collaborations, dependent: :destroy
  has_many :instruments, through: :collaborations

  accepts_nested_attributes_for :collaborations, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true

  validate :daterange_is_correct

  FESTIVAL_START = Time.new(2016, 8, 31)
  FESTIVAL_END = Time.new(2016, 9, 6)

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
      errors.add(:to, 'End of event cant be before or same as the beginning.')
    end

    unless self.to.between? FESTIVAL_START, FESTIVAL_END
      errors.add(:to, 'Date is outside of festival timeframe.')
    end

    unless self.from.between? FESTIVAL_START, FESTIVAL_END
      errors.add(:from, 'Date is outside of festival timeframe.')
    end

  end

end
