class Requirement < ActiveRecord::Base

  include Boardable

  scope :all_uncomplete, -> { where(device_id: nil) }

  belongs_to :event
  belongs_to :device

  def owner_needed?
    self.device.blank?
  end

  def is_unreferenced?
    self.owner_needed?
  end

end
