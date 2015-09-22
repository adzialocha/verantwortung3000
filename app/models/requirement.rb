class Requirement < ActiveRecord::Base

  scope :all_uncomplete, -> { where(device_id: nil) }

  belongs_to :event
  belongs_to :device

  validates :title,  presence: true, :if => 'device.blank?'
  validates :description,  presence: true, :if => 'device.blank?'

  validate :is_occupied
  validate :unique_devices, :unless => 'device.blank?'

  after_create :inform_owner, :unless => 'device.blank?'

  def owner_needed?
    self.device.blank?
  end

  private

  def is_occupied

    existing = Requirement.joins(:event).where('"requirements"."device_id" = :device_id AND "events"."id" != :id AND (("events"."to" >= :to AND "events"."from" <= :from) OR ("events"."to" > :from AND "events"."from" < :to))', device_id: self.device_id, from: self.event.from, to: self.event.to, id: self.event.id).first

    if existing
      errors.add(:device_id, I18n.t("productions.event.form.error_device_occupied"))
    end

  end

  def unique_devices

    device_ids = self.event.requirements.map { |re| re.device_id }

    if device_ids.count(self.device_id) > 1
      errors.add(:device_id, I18n.t("productions.event.form.error_device_unique"))
    end

  end

  def inform_owner
     UserMailer.inform_about_requirement(self.device.user, self).deliver_now
  end

end
