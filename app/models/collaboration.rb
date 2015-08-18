class Collaboration < ActiveRecord::Base

  belongs_to :event
  belongs_to :instrument

  def performer_needed?
    self.instrument.blank?
  end

end
