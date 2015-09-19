class Collaboration < ActiveRecord::Base

  include Boardable

  scope :all_uncomplete, -> { where(instrument_id: nil) }

  belongs_to :event
  belongs_to :instrument

  def performer_needed?
    self.instrument_id.blank?
  end

  def is_unreferenced?
    self.performer_needed?
  end

end
