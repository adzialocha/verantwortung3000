class Requirement < ActiveRecord::Base

  belongs_to :event
  belongs_to :device

  def owner_needed?
    self.device.blank?
  end

end
