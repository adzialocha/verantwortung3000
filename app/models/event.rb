class Event < ActiveRecord::Base

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

  private

  def daterange_is_correct

    if self.from >= self.to
      errors.add(:to, 'End of event cant be before or same as the beginning.')
    end

  end

end
