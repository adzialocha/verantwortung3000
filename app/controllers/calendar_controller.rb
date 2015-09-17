class CalendarController < ApplicationController

  def index
    @events = Event.order(:from).all.group_by(&:group_by_day)
  end

end
