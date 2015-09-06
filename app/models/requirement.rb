class Requirement < ActiveRecord::Base

  scope :all_uncomplete, -> { where(device_id: nil) }

  belongs_to :event
  belongs_to :device

  def owner_needed?
    self.device.blank?
  end

end
