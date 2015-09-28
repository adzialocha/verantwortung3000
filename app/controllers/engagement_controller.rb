class EngagementController < ApplicationController

  def index

    @collaborations = Collaboration.joins(:event).where(:instrument_id => current_user.instruments.map { |re| re.id }).order('events.from')

    @requirements = Requirement.joins(:event).where(:device_id => current_user.devices.map { |re| re.id }).order('events.from')

  end

end
