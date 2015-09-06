class Collaboration < ActiveRecord::Base

  scope :all_uncomplete, -> { where(instrument_id: nil) }

  belongs_to :event
  belongs_to :instrument

  def performer_needed?
    self.instrument_id.blank?
  end

end
