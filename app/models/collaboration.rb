class Collaboration < ActiveRecord::Base

  scope :all_uncomplete, -> { where(instrument_id: nil) }

  belongs_to :event
  belongs_to :instrument

  validates_uniqueness_of :instrument_id, :scope => :event_id, :unless => 'instrument.blank?'

  validates :title,  presence: true, :if => 'instrument.blank?'
  validates :description,  presence: true, :if => 'instrument.blank?'

  validate :is_occupied

  after_create :inform_owner, :unless => 'instrument.blank?'
  before_update :inform_owner, :if => 'self.instrument_id_changed? and ! instrument.blank?'

  def performer_needed?
    self.instrument.blank?
  end

  private

  def is_occupied

    existing = Collaboration.joins(:event).where('"collaborations"."instrument_id" = :instrument_id AND "events"."id" != :id AND (("events"."to" >= :to AND "events"."from" <= :from) OR ("events"."to" > :from AND "events"."from" < :to))', instrument_id: self.instrument_id, from: self.event.from, to: self.event.to, id: self.event.id).first

    if existing
      errors.add :instrument_id, I18n.t("productions.event.form.error_instrument_occupied")
    end

  end

  def inform_owner
     UserMailer.inform_about_collaboration(self.instrument.user, self).deliver_now
  end

end
